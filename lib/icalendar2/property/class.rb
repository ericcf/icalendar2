module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#section-3.8.1.3
    class Klass < Base
      name "CLASS"
      value :types => [:text]
    end
  end
end
