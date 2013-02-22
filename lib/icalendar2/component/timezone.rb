module Icalendar2
  class Timezone < Component::Base
    VALUE = "VTIMEZONE"

    requires :exactly_one => [:tzid]
    accepts :exactly_one => [:last_mod, :created]

    def initialize
      super
      @components = {
        Daylight::VALUE => [],
        Standard::VALUE => []
      }
    end

    def to_ical
      str = "#{Tokens::COMPONENT_BEGIN}:#{VALUE}#{Tokens::CRLF}"
      str << properties_to_ical
      str << "#{Tokens::COMPONENT_END}:#{VALUE}#{Tokens::CRLF}"
    end

    def add_component(component)
      key = component.class.to_s.downcase.gsub('icalendar2::', '').to_sym
      @components[key] = component
    end

    def standard(&block)
      standard_time_c = Standard.new
    end

    def daylight(&block)
      daylight_time_c = Daylight.new
    end

  end

  class Daylight < Timezone
    VALUE = "DAYLIGHT"

    def initialize
      super
    end
  end

  class Standard < Timezone
    VALUE = "STANDARD"

    def initialize
      super
    end
  end

end