module Icalendar2
  # See http://tools.ietf.org/html/rfc5545#section-3.3.8
  class IntegerValue < Value
    matches /^(?:\+?|-)\d+$/
  end
end
