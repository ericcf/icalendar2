module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#page-103
    class Tzid < Base
      name "TZID"
      value :types => [:text]
    end
  end
end