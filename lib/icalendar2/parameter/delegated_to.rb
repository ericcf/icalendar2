module Icalendar2
  module Parameter
    # See http://tools.ietf.org/html/rfc5545#section-3.2.5
    class DelegatedTo < Base
      format /^DELEGATED-TO="#{Tokens::URI}"(?:,"#{Tokens::URI}")*$/
    end
  end
end
