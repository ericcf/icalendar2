module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#section-3.8.4.3
    class Organizer < Base
      name "ORGANIZER"
      value :types => [:cal_address]
    end
  end
end
