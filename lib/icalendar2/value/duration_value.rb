module Icalendar2
  # See http://tools.ietf.org/html/rfc5545#section-3.3.6
  class DurationValue < Value
    DUR_DAY = "\\d+D"
    DUR_SECOND = "\\d{1,2}S"
    DUR_MINUTE = "\\d{1,2}M(?:#{DUR_SECOND})?"
    DUR_HOUR = "\\d{1,2}H(?:#{DUR_MINUTE})?"
    DUR_TIME = "T(?:#{DUR_HOUR}|#{DUR_MINUTE}|#{DUR_SECOND})"
    DUR_DATE = "#{DUR_DAY}(?:#{DUR_TIME})?"
    DUR_WEEK = "\\d+W"
    BASE_FORMAT = "P(?:#{DUR_DATE}|#{DUR_TIME}|#{DUR_WEEK})"
    matches /^(?:\+?|-)#{BASE_FORMAT}$/
  end
end
