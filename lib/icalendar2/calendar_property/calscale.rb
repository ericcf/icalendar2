module Icalendar2
  module CalendarProperty
    # See http://tools.ietf.org/html/rfc5545#section-3.7.1
    class Calscale < Property::Base
      name "CALSCALE"
      value :types => [:text]
    end
  end
end
