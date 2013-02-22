module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#section-3.6.6
    class Repeat < Base
      name "REPEAT"
      value :types => [:integer]
    end
  end
end
