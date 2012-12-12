module Icalendar2
  class Value

    class << self; attr_reader :format_matcher end
    @format_matcher = nil

    attr_reader :value

    def self.matches(matcher)
      @format_matcher = matcher
    end

    def self.get_factory(value_sym)
      # :foo => "Foo", :bar_baz => "BarBaz", etc.
      value_name = value_sym.to_s.split(/_/).map(&:capitalize).join('')
      Icalendar2.const_get("#{value_name}Value", false)
    end

    def initialize(value)
      @valid = true
      @value = value
      validate
    end

    def valid?
      @valid
    end

    def to_s
      value.to_s
    end

    private

    def validate
      unless self.class.format_matcher.nil?
        if value.respond_to?(:to_s) && (val = value.to_s).respond_to?(:match)
          @valid = !!val.match(self.class.format_matcher)
        else
          @valid = false
        end
      end
    end
  end
end
