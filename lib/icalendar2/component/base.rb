module Icalendar2
  module Component
    require 'socket'

    class Base

      class << self; attr_reader :property_names end
      class << self; attr_reader :required_property_names end

      def self.requires(properties = {})
        add_properties(properties)
        @required_property_names = properties.values.flatten
      end

      def self.accepts(properties = {})
        add_properties(properties)
      end

      def initialize
        @components = {}
        @properties = {}
      end

      def add_component(component)
        key = (component.class.to_s.downcase + 's').gsub('icalendar2::', '').to_sym

        unless @components.has_key? key
          @components[key] = []
        end

        @components[key] << component
      end

      def new_uid
        "#{DateTime.now}_#{rand(999999999)}@#{Socket.gethostname}"
      end

      def new_timestamp
        DateTime.now
      end

      def valid?
        present_property_names = @properties.keys
        @properties.values.flatten.all?(&:valid?) &&
          self.class.required_property_names.all? { |p| present_property_names.include?(p.to_s) }
      end

      def set_property(property_name, value, parameters = {})
        name = (property_name == "class" ? "klass" : property_name)
        unless self.class.property_names.include? name.to_sym
          raise "#{self.class} component property #{name} not defined"
        end
        self.send(name, value, parameters)
      end

      private

      def self.add_properties(properties)
        single_properties = properties[:exactly_one] || []
        single_properties.each do |property_sym|
          define_accessor(property_sym)
        end
        multiple_properties = properties[:one_or_more] || []
        multiple_properties.each do |property_sym|
          define_multiple_accessor(property_sym)
        end
        @property_names ||= []
        @property_names += single_properties + multiple_properties
      end

      def self.define_accessor(property_sym)
        define_method(property_sym) do |*args|
          value, parameters = *args
          if value.nil?
            @properties[property_sym.to_s]
          else
            @properties[property_sym.to_s] = Property.get_factory(property_sym).new(value, parameters)
          end
        end
        alias_method "#{property_sym}=", property_sym
      end

      def self.define_multiple_accessor(property_sym)
        property_factory = Property.get_factory(property_sym)
        define_method(property_factory::PLURAL) do
          @properties[property_sym.to_s]
        end
        define_method(property_sym) do |*args|
          value, parameters = *args
          @properties[property_sym.to_s] ||= []
          @properties[property_sym.to_s] << property_factory.new(value, parameters)
        end
        alias_method "#{property_sym}=", property_sym
      end

      def properties_to_ical
        sorted_properties = @properties.zip.map(&:first).sort
        sorted_properties.map { |p| p[1] && Array(p[1]).map(&:to_ical) }.join
      end
    end
  end
end
