module Icalendar2
  module CalendarProperty
    # See http://tools.ietf.org/html/rfc5545#section-3.7.3
    class Prodid < Property::Base
      name "PRODID"
      value :types => [:text]
    end
  end
end
