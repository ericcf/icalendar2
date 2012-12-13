module Icalendar2
  module CalendarProperty
    def self.get_factory(calendar_property_name)
      # "VERSION" => CalendarProperty::Version, etc.
      begin
        property_class_name = calendar_property_name.to_s.capitalize
        const_get(property_class_name) if const_defined?(property_class_name)
      rescue NameError
        nil
      end
    end
  end
end
