module Icalendar2
  module Parameter
    # See http://tools.ietf.org/html/rfc5545#section-3.2.1
    class Altrep < Base
      format /^ALTREP="#{Tokens::URI}"$/
    end
  end
end
