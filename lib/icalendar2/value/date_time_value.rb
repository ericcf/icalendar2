module Icalendar2
  # See http://tools.ietf.org/html/rfc5545#section-3.3.5
  class DateTimeValue < Value
    matches /^#{Tokens::DATE_TIME}$/

    def initialize(value)
      if value.is_a?(DateTime)
        super(value.strftime('%Y%m%dT%H%M%S'))
      else
        super(value)
      end
    end
  end
end
