module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#section-3.8.5.3
    class Rrule < Base
      PLURAL = "rrules"
      name "RRULE"
      value :types => [:recur]
    end
  end
end
