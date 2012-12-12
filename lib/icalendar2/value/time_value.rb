module Icalendar2
  # See http://tools.ietf.org/html/rfc5545#section-3.3.12
  class TimeValue < Value
    matches /^#{Tokens::TIME}$/
  end
end
