require 'date'

module Icalendar2
  autoload :Calendar, "icalendar2/calendar"

  autoload :Parser, "icalendar2/parser"
  autoload :Tokens, "icalendar2/tokens"

  autoload :Component, "icalendar2/component"
  autoload :Event, "icalendar2/component/event"
  module Component
    autoload :Base, "icalendar2/component/base"
  end

  autoload :Value, "icalendar2/value"
  autoload :BinaryValue, "icalendar2/value/binary_value"
  autoload :BooleanValue, "icalendar2/value/boolean_value"
  autoload :CalAddressValue, "icalendar2/value/cal_address_value"
  autoload :DateValue, "icalendar2/value/date_value"
  autoload :DateTimeValue, "icalendar2/value/date_time_value"
  autoload :DurationValue, "icalendar2/value/duration_value"
  autoload :FloatValue, "icalendar2/value/float_value"
  autoload :IntegerValue, "icalendar2/value/integer_value"
  autoload :LatLonValue, "icalendar2/value/lat_lon_value"
  autoload :PeriodValue, "icalendar2/value/period_value"
  autoload :RecurValue, "icalendar2/value/recur_value"
  autoload :TextValue, "icalendar2/value/text_value"
  autoload :TimeValue, "icalendar2/value/time_value"
  autoload :UriValue, "icalendar2/value/uri_value"

  autoload :CalendarProperty, "icalendar2/calendar_property"
  module CalendarProperty
    autoload :Calscale, "icalendar2/calendar_property/calscale"
    autoload :Method, "icalendar2/calendar_property/method"
    autoload :Prodid, "icalendar2/calendar_property/prodid"
    autoload :Version, "icalendar2/calendar_property/version"
  end

  autoload :Parameter, "icalendar2/parameter"
  module Parameter
    autoload :Base, "icalendar2/parameter/base"
    autoload :Fmttype, "icalendar2/parameter/fmttype"
  end

  autoload :Property, "icalendar2/property"
  module Property
    autoload :Base, "icalendar2/property/base"
    autoload :Nil, "icalendar2/property/nil"
    autoload :Attach, "icalendar2/property/attach"
    autoload :Attendee, "icalendar2/property/attendee"
    autoload :Categories, "icalendar2/property/categories"
    autoload :Klass, "icalendar2/property/class"
    autoload :Comment, "icalendar2/property/comment"
    autoload :Contact, "icalendar2/property/contact"
    autoload :Description, "icalendar2/property/description"
    autoload :Dtend, "icalendar2/property/dtend"
    autoload :Dtstamp, "icalendar2/property/dtstamp"
    autoload :Dtstart, "icalendar2/property/dtstart"
    autoload :Exdate, "icalendar2/property/exdate"
    autoload :Geo, "icalendar2/property/geo"
    autoload :LastMod, "icalendar2/property/last_mod"
    autoload :Location, "icalendar2/property/location"
    autoload :Organizer, "icalendar2/property/organizer"
    autoload :Priority, "icalendar2/property/priority"
    autoload :Rdate, "icalendar2/property/rdate"
    autoload :Resources, "icalendar2/property/resources"
    autoload :RelatedTo, "icalendar2/property/related_to"
    autoload :Rrule, "icalendar2/property/rrule"
    autoload :Rstatus, "icalendar2/property/rstatus"
    autoload :Sequence, "icalendar2/property/sequence"
    autoload :Summary, "icalendar2/property/summary"
    autoload :Uid, "icalendar2/property/uid"
  end
end
