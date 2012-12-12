module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#section-3.8.1.6
    class Geo < Base
      name "GEO"
      value :types => [:lat_lon]
    end
  end
end
