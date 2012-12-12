module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#section-3.8.1.12
    class Summary < Base
      name "SUMMARY"
      value :types => [:text]
    end
  end
end
