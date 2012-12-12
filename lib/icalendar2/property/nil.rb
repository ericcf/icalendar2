module Icalendar2
  module Property
    class Nil
      def value
        nil
      end

      def to_ical
        ""
      end
    end
  end
end
