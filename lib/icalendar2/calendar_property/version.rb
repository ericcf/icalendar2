module Icalendar2
  module CalendarProperty
    # See http://tools.ietf.org/html/rfc5545#section-3.7.4
    class Version < Property::Base
      name "VERSION"
      value :types => [:text]
    end
  end
end
