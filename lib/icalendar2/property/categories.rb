module Icalendar2
  module Property
    # See http://tools.ietf.org/html/rfc5545#section-3.8.1.2
    class Categories < Base
      PLURAL = "categories_properties"
      name "CATEGORIES"
      value :types => [:text], :list => true
    end
  end
end
