require 'spec_helper'

describe Icalendar2::Timezone do

  subject { Timezone.new }

  let(:ical_str) do
str = <<EOS
BEGIN:VTIMEZONE
TZID:Europe/London
BEGIN:DAYLIGHT
DTSTART:19810329T010000
RRULE:FREQ=YEARLY;BYMONTH=3;BYDAY=-1SU
TZNAME:BST
TZOFFSETFROM:+0000
TZOFFSETTO:+0100
END:DAYLIGHT
BEGIN:DAYLIGHT
DTSTART:21170329T010000
RRULE:FREQ=YEARLY;BYMONTH=3;BYDAY=-1SU
TZNAME:NBST
TZOFFSETFROM:+0000
TZOFFSETTO:+0100
END:DAYLIGHT
BEGIN:STANDARD
DTSTART:19961027T020000
RRULE:FREQ=YEARLY;BYMONTH=10;BYDAY=-1SU
TZNAME:GMT
TZOFFSETFROM:+0100
TZOFFSETTO:+0000
END:STANDARD
END:VTIMEZONE
EOS
    str.gsub(/\n/, Tokens::CRLF)
  end

  it "converts to icalendar format" do
    subject.tzid = "Europe/London"
    daylight_1 = Timezone::Daylight.new
    daylight_2 = Timezone::Daylight.new
    standard = Timezone::Standard.new
    daylight_1.tzoffsetfrom = daylight_2.tzoffsetfrom = "+0000"
    daylight_1.tzoffsetto = daylight_2.tzoffsetto = "+0100"
    daylight_1.rrule = daylight_2.rrule = "FREQ=YEARLY;BYMONTH=3;BYDAY=-1SU"
    daylight_1.dtstart = DateTime.new(1981, 03, 29, 01, 00, 00)
    daylight_1.tzname = "BST"
    daylight_2.dtstart = DateTime.new(2117, 03, 29, 01, 00, 00)
    daylight_2.tzname = "NBST"
    standard.tzoffsetfrom = "+0100"
    standard.tzoffsetto = "+0000"
    standard.rrule = "FREQ=YEARLY;BYMONTH=10;BYDAY=-1SU"
    standard.dtstart = DateTime.new(1996, 10, 27, 02, 00, 00)
    standard.tzname = "GMT"

    subject.add_daytime_component(daylight_1)
    subject.add_daytime_component(daylight_2)
    subject.add_standard_component(standard)

    subject.to_ical.should eq(ical_str)
    subject.valid?.should eq(true)
  end

  it "is invalid to have an empty timezone" do
    cal = Calendar.new
    cal.timezone do
    end

    cal.valid?.should eq(false)
  end
end