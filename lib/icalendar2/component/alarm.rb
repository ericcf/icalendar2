module Icalendar2
  class Alarm < Component::Base
    VALUE = "VALARM"

    requires :exactly_one => [:action, :trigger]
    accepts :exactly_one => [:description, :duration, :repeat]

    def initialize
      super
    end

    def to_ical
      str = "#{Tokens::COMPONENT_BEGIN}:#{VALUE}#{Tokens::CRLF}"
      str << properties_to_ical
      str << "#{Tokens::COMPONENT_END}:#{VALUE}#{Tokens::CRLF}"
    end
  end
end