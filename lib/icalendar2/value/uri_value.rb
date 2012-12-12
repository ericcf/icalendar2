module Icalendar2
  # See http://tools.ietf.org/html/rfc5545#section-3.3.13
  class UriValue < Value
    matches /^#{Tokens::URI}$/
  end
end
