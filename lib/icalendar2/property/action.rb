module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#page-72
    class Action < Base
      name "ACTION"
      value :types => [:text]
    end
  end
end