module Icalendar2
  module Parameter
    # See http://tools.ietf.org/html/rfc5545#section-3.2.4
    class DelegatedFrom < Base
      format /^DELEGATED-FROM="#{Tokens::URI}"(?:,"#{Tokens::URI}")*$/
    end
  end
end
