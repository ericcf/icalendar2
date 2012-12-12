module Icalendar2
  module Parameter
    # See http://tools.ietf.org/html/rfc5545#section-3.2.3
    class Cutype < Base
      format /^CUTYPE=(?:INDIVIDUAL|GROUP|RESOURCE|ROOM|UNKNOWN|(?:#{Tokens::X_NAME})|(?:#{Tokens::IANA_TOKEN}))$/
    end
  end
end
