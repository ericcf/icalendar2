module Icalendar2
  # See http://tools.ietf.org/html/rfc5545#section-3.3.11
  # This will escape text passed in, so do not escape it first!
  class TextValue < Value

    def initialize(value)
      if value.respond_to?(:gsub)
        super(value.gsub(/\\/, "\\\\\\").gsub(';', '\;').gsub(',', '\,').gsub("\r\n", "\n").gsub("\r", "\n"))
      else
        super(value)
      end
    end
  end
end
