module Icalendar2
  # See http://tools.ietf.org/html/rfc5545#section-3.3.3
  class CalAddressValue < Value
    matches /^#{Tokens::URI}$/
  end
end
