module Icalendar2
  # See http://tools.ietf.org/html/rfc5545#section-3.3.11
  # This will escape text passed in, so do not escape it first!
  class TextValue < Value

    def initialize(value)
      replacements = {
        '\\' =>     '\\\\',
        ';' =>      '\;',
        ',' =>      '\,',
        "\r\n" =>   "\n",
        "\r" =>     "\n"
      }
      super(value.respond_to?(:gsub) ? value.gsub(/\\|;|,|\r\n|\r/, replacements) : value)
    end
  end
end
