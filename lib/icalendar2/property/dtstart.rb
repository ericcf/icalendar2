module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#section-3.8.2.4
    class Dtstart < Base
      name "DTSTART"
      value :types => [:date_time, :date]
    end
  end
end
