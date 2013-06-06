module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#section-3.8.2.2
    class Dtend < Base
      name "DTEND"
      value :types => [:date_time, :date]
    end
  end
end
