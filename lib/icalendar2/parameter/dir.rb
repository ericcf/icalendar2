module Icalendar2
  module Parameter
    # See http://tools.ietf.org/html/rfc5545#section-3.2.6
    class Dir < Base
      format /^DIR="#{Tokens::URI}"$/
    end
  end
end
