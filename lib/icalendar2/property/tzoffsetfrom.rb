module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#page-72
    class Tzoffsetfrom < Base
      name "TZOFFSETFROM"
      value :types => [:text]
    end
  end
end