module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#section-3.8.1.9
    class Priority < Base
      name "PRIORITY"
      value :types => [:integer]
    end
  end
end
