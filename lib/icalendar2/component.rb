module Icalendar2
  module Component
    def self.get_factory(component_name)
      # "VFOO" => "Foo", etc.
      Icalendar2.const_get(component_name.gsub(/^V/, "").capitalize, false)
    end
  end
end
