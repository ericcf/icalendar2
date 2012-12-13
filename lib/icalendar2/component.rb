module Icalendar2
  module Component
    def self.get_factory(component_name)
      # "VFOO" => "Foo", etc.
      component_class_name = component_name.gsub(/^V/, "").capitalize
      Icalendar2.const_get(component_class_name) if Icalendar2.const_defined?(component_class_name)
    end
  end
end
