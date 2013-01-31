module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#section-3.8.7.1
    class Created < Base
      name "CREATED"
      value :types => [:date_time]
    end
  end
end
