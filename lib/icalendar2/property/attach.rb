module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#section-3.8.1.1
    class Attach < Base
      PLURAL = "attachments"
      name "ATTACH"
      value :types => [:uri, :binary]
    end
  end
end
