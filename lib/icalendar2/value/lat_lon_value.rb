module Icalendar2
  # Made up of two floats separated by a semicolon.
  class LatLonValue < Value
    matches /^#{FloatValue::BASE_FORMAT};#{FloatValue::BASE_FORMAT}$/
  end
end
