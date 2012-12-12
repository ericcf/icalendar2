module Icalendar2
  module Parameter
    # See http://tools.ietf.org/html/rfc5545#section-3.2.8
    class Fmttype < Base
      TYPE_NAME = "(?:#{Tokens::ALPHA}|#{Tokens::DIGIT}|[-!#$&.+^_])+"
      SUBTYPE_NAME = TYPE_NAME
      format /^FMTTYPE=#{TYPE_NAME}\/#{SUBTYPE_NAME}$/
    end
  end
end
