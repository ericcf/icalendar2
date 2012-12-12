module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#section-3.8.4.7
    class Uid < Base
      name "UID"
      value :types => [:text]
    end
  end
end
