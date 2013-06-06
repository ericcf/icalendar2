module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#section-3.8.4.6
    class Url < Base
      name "URL"
      value :types => [:text]
    end
  end
end
