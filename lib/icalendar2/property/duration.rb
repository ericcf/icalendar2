module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#section-3.6.6
    class Duration < Base
      name "DURATION"
      value :types => [:text]
    end
  end
end
