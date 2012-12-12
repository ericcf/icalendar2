module Icalendar2
  # See http://tools.ietf.org/html/rfc5545#section-3.3.4
  class DateValue < Value
    matches /^#{Tokens::DATE}$/

    def initialize(value)
      if value.is_a?(Date)
        super(value.strftime('%Y%m%d'))
      else
        super(value)
      end
    end
  end
end
