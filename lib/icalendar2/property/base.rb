module Icalendar2
  module Property
    class Base
      MAX_LINE_LENGTH = 75

      attr_reader :value, :parameters

      class << self; attr_reader :value_types end
      class << self; attr_reader :value_factories end

      def self.value(options = {})
        if !options[:types].respond_to?(:map)
          raise ":types option must be enumberable, was #{options[:types]}"
        end
        @value_types = options[:types]
        @value_factories = options[:types].map { |t| Value.get_factory(t) }
        define_method(:list?) do
          options[:list]
        end
      end

      def self.name(str)
        define_method(:name) { str }
      end

      def initialize(value, parameters = {})
        @value = if list?
          value_list = value.respond_to?(:gsub) ? split_list(value) : value
          value_list.map { |v| value_object(v) }
        else
          value_object(value)
        end
        if @value.nil?
          raise "Invalid value for #{self.class}: '#{value}'. Must be one of these types: #{self.class.value_types}"
        end
        @parameters = parameters || {}
        validate
      end

      def name
        raise "Must define name attribute in Property sublcass #{self.class}."
      end

      def valid?
        @valid
      end

      def value_str
        Array(value).map { |v| v.to_s.respond_to?(:strip) ? v.to_s.strip : v }.join(",")
      end

      def to_ical
        parameters_str = @parameters.map { |k, v| "#{k}=#{v}" }.join(";")
        parameters_str = ";#{parameters_str}" if parameters_str != ""
        str = fold("#{name}#{parameters_str}:#{value_str}")
        str << Tokens::CRLF
      end

      private

      LIST_SEPARATOR = /([^\\]),/

      def validate
        @valid = if @value.is_a? Array
          @value.compact.all?(&:valid?)
        else
          @value.valid?
        end
      end

      def value_object(value)
        self.class.value_factories.each do |f|
          obj = f.new(value)
          return obj if obj.valid?
        end

        nil
      end

      def fold(str)
        str.scan(/.{1,#{MAX_LINE_LENGTH}}/).join("#{Tokens::CRLF} ")
      end

      def split_list(str)
        # Ruby 1.8.7 doesn't support negative lookbehind, so using this hack...
        str.gsub(LIST_SEPARATOR, "\\1x,").split(/x,/)
      end
    end
  end
end
