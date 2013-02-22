module Icalendar2
  # See http://tools.ietf.org/html/rfc5545#section-3.4
  class Calendar
    VALUE = "VCALENDAR"

    def initialize
      @components = {
        Event::VALUE => []
      }
      @properties = {
        "calscale" => Property::Nil.new,
        "method" =>   Property::Nil.new,
        "prodid" =>   Property::Nil.new,
        "version" =>  Property::Nil.new
      }
    end

    def calscale(value = nil)
      set_property(:calscale, value)
    end

    def method_property(value = nil)
      set_property(:method, value)
    end

    def prodid(value = nil)
      set_property(:prodid, value)
    end

    def version(value = nil)
      set_property(:version, value)
    end

    def set_property(property_name, value, parameters = {})
      property = property_name.to_s.downcase
      if value.nil?
        @properties[property].value.to_s
      elsif (factory = CalendarProperty.get_factory(property_name))
        if value.is_a? factory
          @properties[property] = value
        else
          @properties[property] = factory.new(value)
        end
      end
    end

    def events
      @components[Event::VALUE]
    end

    def event(&block)
      e = Event.new
      e.instance_eval(&block)
      events << e

      e
    end

    def add_event(event)
      events << event
    end

    def timezones
      @components[Timezone::VALUE]
    end

    def timezone(&block)
      e = Timezone.new
      e.instance_eval(&block)
      timezones << e

      e
    end

    def to_ical
      str = "#{Tokens::COMPONENT_BEGIN}:#{VALUE}#{Tokens::CRLF}"
      str << body_to_ical
      str << "#{Tokens::COMPONENT_END}:#{VALUE}#{Tokens::CRLF}"
      str = str.encode("UTF-8") if str.respond_to?(:encode)
      
      str
    end

    def add_component(component)
      @components[component.class::VALUE] << component
    end

    def valid?
      events.all?(&:valid?)
    end

    private

    def body_to_ical
      sorted_properties = @properties.zip.map(&:first).sort
      str = sorted_properties.map { |p| p[1] && p[1].to_ical }.join
      str << events.map(&:to_ical).join
    end
  end
end
