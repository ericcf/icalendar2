module Icalendar2
  module Parameter
    class Base

      class << self; attr_reader :format_matcher end

      def self.format(matcher)
        @format_matcher = matcher
      end

      def initialize(value)
        @valid = true
        @value = value
        validate
      end

      def valid?
        @valid
      end

      private

      def validate
        unless self.class.format_matcher.nil?
          if @value.respond_to?(:to_s) && (val = @value.to_s).respond_to?(:match)
            @valid = !!val.match(self.class.format_matcher)
          else
            @valid = false
          end
        end
      end
    end
  end
end
