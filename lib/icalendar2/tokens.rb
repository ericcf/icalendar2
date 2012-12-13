module Icalendar2
  module Tokens
    COMPONENT_BEGIN =    "BEGIN"
    COMPONENT_END =      "END"
    CRLF =               "\r\n"
    HTAB =               /\t/
    DQUOTE =             /"/
    SOLIDUS =            /\//
    ALPHA =              /[a-zA-Z]/
    DIGIT =              /[0-9]/
    CONTROL_CHARS =      "\x00-\x08\x0A-\x1F\x7F"
    CONTROL =            /[#{CONTROL_CHARS}]/
    QSAFE_CHAR =         /[^"#{CONTROL_CHARS}]/
    SAFE_CHAR =          /[^"#{CONTROL_CHARS};:,]/
    VALUE_CHAR =         /[^#{CONTROL_CHARS}]/
    NON_US_ASCII_CHARS = "\x80-\xFF"
    QUOTED_STRING =      /#{DQUOTE}(?:#{SAFE_CHAR})*#{DQUOTE}/
    PARAM_VALUE =        "(?:#{SAFE_CHAR})*|#{QUOTED_STRING}"
    IANA_TOKEN =         "[-a-zA-Z0-9]+"
    VENDORID =           "[a-zA-Z0-9]{3}"
    X_NAME =             "X-(?:#{VENDORID}-)?#{IANA_TOKEN}"

    DATE =               /\d{4}(?:0[1-9]|1[012])(?:0[1-9]|[12][0-9]|3[01])/
    TIME =               /(?:[01][0-9]|2[0-3])(?:[0-5][0-9])(?:[0-5][0-9]|60)Z?/
    DATE_TIME =          /#{DATE}T#{TIME}/

    # URI components
    SCHEME =             "#{ALPHA}(?:#{ALPHA}|#{DIGIT}|[-+.])*"
    HIER_PART =          '[^"<>]+'
    URI =                "#{SCHEME}:#{HIER_PART}"
  end
end
