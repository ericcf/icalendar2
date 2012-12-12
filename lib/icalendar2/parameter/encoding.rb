module Icalendar2
  module Parameter
    # See http://tools.ietf.org/html/rfc5545#section-3.2.7
    class Encoding < Base
      format /^ENCODING=(?:8BIT|BASE64)$/
    end
  end
end
