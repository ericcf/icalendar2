module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#page-103
    class Tzname < Base
      name "TZNAME"
      PLURAL = "tznames"
      value :types => [:text]
    end
  end
end