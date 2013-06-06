module Icalendar2
  class Timezone < Component::Base
    VALUE = "VTIMEZONE"

    requires :exactly_one => [:tzid]
    accepts :exactly_one => [:last_mod, :created]

    def initialize
      super

      @components = {
        Timezone::Daylight::VALUE => [],
        Timezone::Standard::VALUE => []
      }
    end

    class Daylight < Timezone
      VALUE = "DAYLIGHT"

      requires :exactly_one => [:dtstart, :tzoffsetfrom, :tzoffsetto]
      accepts :exactly_one => [:tzname, :rrule, :rdate, :comment]

      def initialize
        super
        @properties = {}
        @components = {}
      end

      def to_ical
        str = "#{Tokens::COMPONENT_BEGIN}:#{VALUE}#{Tokens::CRLF}"
        str << properties_to_ical
        str << "#{Tokens::COMPONENT_END}:#{VALUE}#{Tokens::CRLF}"

        str
      end
    end

    class Standard < Timezone
      VALUE = "STANDARD"

      requires :exactly_one => [:dtstart, :tzoffsetfrom, :tzoffsetto]
      accepts :exactly_one => [:rrule]
      accepts :one_or_more => [:comment, :tzname, :rdate]

      def initialize
        super
        @properties = {}
        @components = {}
      end

      def to_ical
        str = "#{Tokens::COMPONENT_BEGIN}:#{VALUE}#{Tokens::CRLF}"
        str << properties_to_ical
        str << "#{Tokens::COMPONENT_END}:#{VALUE}#{Tokens::CRLF}"

        str
      end
    end

    def to_ical
      str = "#{Tokens::COMPONENT_BEGIN}:#{VALUE}#{Tokens::CRLF}"
      str << properties_to_ical
      str << daylight_to_ical if daylight_times
      str << standard_to_ical if standard_times
      str << "#{Tokens::COMPONENT_END}:#{VALUE}#{Tokens::CRLF}"
    end

    def standard_times
      @components[Standard::VALUE]
    end

    def daylight_times
      @components[Daylight::VALUE]
    end

    def add_standard_component(standard_time)
      @components[Standard::VALUE] << standard_time
    end

    def add_daytime_component(daylight_time)
      @components[Daylight::VALUE] << daylight_time
    end

    def add_time_component_value(type, value)
      @components[type::VALUE] << value
    end

    def standard(&block)
      s = Timezone::Standard.new
      s.instance_eval(&block)
      #add_time_component_value(Standard, s)
      add_standard_component(s)

      s
    end

    def daylight(&block)
      d = Timezone::Daylight.new
      d.instance_eval(&block)
      #add_time_component_value(Daylight, d)
      add_daytime_component(d)

      d
    end

    def daylight_to_ical
      str = ""
      str << daylight_times.map(&:to_ical).join
      str
    end

    def standard_to_ical
      str = ""
      str << standard_times.map(&:to_ical).join
      str
    end
  end
end