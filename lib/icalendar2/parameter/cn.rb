module Icalendar2
  module Parameter
    # See http://tools.ietf.org/html/rfc5545#section-3.2.2
    class Cn < Base
      format /^CN=#{Tokens::PARAM_VALUE}$/
    end
  end
end
