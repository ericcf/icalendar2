module Icalendar2
  # See http://tools.ietf.org/html/rfc5545#section-3.3.9
  class PeriodValue < Value
    PERIOD_EXPLICIT = "(?:#{Tokens::DATE_TIME}/#{Tokens::DATE_TIME})"
    PERIOD_START = "(?:#{Tokens::DATE_TIME}/#{DurationValue::BASE_FORMAT})"
    matches /^#{PERIOD_EXPLICIT}|#{PERIOD_START}$/
  end
end
