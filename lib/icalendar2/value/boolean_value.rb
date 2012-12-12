module Icalendar2
  # See http://tools.ietf.org/html/rfc5545#section-3.3.2
  class BooleanValue < Value
    matches /^true$|^false$/i
  end
end
