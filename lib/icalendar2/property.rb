module Icalendar2
  module Property
    def self.get_factory(property_sym)
      # :foo => "Foo", :bar_baz => "BarBaz", etc.
      property_name = property_sym.to_s.split(/_/).map(&:capitalize).join('')
      const_get(property_name) if const_defined?(property_name)
    end
  end
end
