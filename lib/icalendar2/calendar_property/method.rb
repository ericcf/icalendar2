module Icalendar2
  module CalendarProperty
    # See http://tools.ietf.org/html/rfc5545#section-3.7.2
    class Method < Property::Base
      name "METHOD"
      value :types => [:text]
    end
  end
end
