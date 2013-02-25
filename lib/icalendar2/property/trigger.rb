module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#page-72
    class Trigger < Base
      name "TRIGGER"
      value :types => [:text]
    end
  end
end