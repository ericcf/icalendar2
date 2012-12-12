module Icalendar2
  # See http://tools.ietf.org/html/rfc5545#section-3.3.7
  class FloatValue < Value
    BASE_FORMAT = '(?:\+?|-)\d+(?:\.\d+)?'
    matches /^#{BASE_FORMAT}$/
  end
end
