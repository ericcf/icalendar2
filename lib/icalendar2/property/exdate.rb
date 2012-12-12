module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#section-3.8.5.1
    class Exdate < Base
      PLURAL = "exdates"
      name "EXDATE"
      value :types => [:date_time, :date], :list => true
    end
  end
end
