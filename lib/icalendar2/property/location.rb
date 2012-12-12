module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#section-3.8.1.7
    class Location < Base
      name "LOCATION"
      value :types => [:text]
    end
  end
end
