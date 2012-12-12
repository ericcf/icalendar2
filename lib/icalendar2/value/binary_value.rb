module Icalendar2
  # See http://tools.ietf.org/html/rfc5545#section-3.3.1
  class BinaryValue < Value
    B_CHAR = "[a-z0-9+/]"
    B_END = "#{B_CHAR}#{B_CHAR}==|#{B_CHAR}#{B_CHAR}#{B_CHAR}="
    matches /^(?:#{B_CHAR}#{B_CHAR}#{B_CHAR}#{B_CHAR})*(?:#{B_END})?$/i
  end
end
