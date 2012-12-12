module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#section-3.8.7.4
    class Sequence < Base
      name "SEQUENCE"
      value :types => [:integer]
    end
  end
end
