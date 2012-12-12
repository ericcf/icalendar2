module Icalendar2
  module CalendarProperty
    def self.get_factory(calendar_property_name)
      # "VERSION" => CalendarProperty::Version, etc.
      begin
        const_get(calendar_property_name.capitalize, false)
      rescue NameError
        nil
      end
    end
  end
end
