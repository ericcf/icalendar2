module Icalendar2
  # See http://tools.ietf.org/html/rfc5545#section-3.3.10
  class RecurValue < Value
    FREQ = "(?:SECONDLY|MINUTELY|HOURLY|DAILY|WEEKLY|MONTHLY|YEARLY)"
    ENDDATE = "(?:#{Tokens::DATE}|#{Tokens::DATE_TIME})"

    SECONDS =         "(?:\d{1,2})"
    BYSECLIST =       "(?:#{SECONDS}(?:,#{SECONDS})*)"

    MINUTES =         "(?:\d{1,2})"
    BYMINLIST =       "(?:#{MINUTES}(?:,#{MINUTES})*)"

    HOURS =           "(?:\d{1,2})"
    BYHRLIST =      "(?:#{HOURS}(?:,#{HOURS})*)"

    ORDWK =           "(?:\d{1,2})"
    WEEKDAY =         "(?:SU|MO|TU|WE|TH|FR|SA)"
    WEEKDAYNUM =      "(?:[-+]?#{ORDWK}?#{WEEKDAY})"
    BYWDAYLIST =      "(?:#{WEEKDAYNUM}(?:,#{WEEKDAYNUM})*)"

    MONTHDAYNUM =     "(?:[-+]?\d{1,2})"
    BYMODAYLIST =     "(?:#{MONTHDAYNUM}(?:,#{MONTHDAYNUM})*)"

    YEARDAYNUM =      "(?:[-+]?\d{1,2})"
    BYYRDAYLIST =     "(?:#{YEARDAYNUM}(?:,#{YEARDAYNUM})*)"

    WEEKNUM =         "(?:[-+]?\d{1,2})"
    BYWKNOLIST =      "(?:#{WEEKNUM}(?:,#{WEEKNUM})*)"

    MONTHNUM =        "(?:\d{1,2})"
    BYMOLIST =        "(?:#{MONTHNUM}(?:,#{MONTHNUM})*)"

    BYSPLIST =        "(?:#{YEARDAYNUM}(?:,#{YEARDAYNUM})*)"

    RECUR_RULE_PART = "FREQ=#{FREQ}|UNTIL=#{ENDDATE}|COUNT=\d+|INTERVAL=\d+|BYSECOND=#{BYSECLIST}|BYMINUTE=#{BYMINLIST}|BYHOUR=#{BYHRLIST}|BYDAY=#{BYWDAYLIST}|BYMONTHDAY=#{BYMODAYLIST}|BYYEARDAY=#{BYYRDAYLIST}|BYWEEKNO=#{BYWKNOLIST}|BYMONTH=#{BYMOLIST}|BYSETPOS=#{BYSPLIST}|WKST=#{WEEKDAY}"

    matches /^#{RECUR_RULE_PART}(?:;#{RECUR_RULE_PART})*$/
  end
end
