module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#section-3.8.7.2
    class Dtstamp < Base
      name "DTSTAMP"
      value :types => [:date_time]
    end
  end
end
