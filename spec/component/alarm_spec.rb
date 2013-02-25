require 'spec_helper'

describe Icalendar2::Alarm do

  cal = Calendar.new
  cal.event do
    summary "An event"
    dtstamp DateTime.new(2012, 11, 24, 8, 15, 0)
    uid "12345"
    dtstart DateTime.new(2012, 12, 3, 1, 2, 3)
    alarm do
      action "DISPLAY"
      description "First alarm"
      trigger "-PT15M"
      duration "PT15M"
      repeat 1
    end
  end

  let(:ical_str) do
str = <<EOS
BEGIN:VCALENDAR
BEGIN:VEVENT
DTSTAMP:20121124T081500
DTSTART:20121203T010203
SUMMARY:An event
UID:12345
BEGIN:VALARM
ACTION:DISPLAY
DESCRIPTION:First alarm
DURATION:PT15M
REPEAT:1
TRIGGER:-PT15M
END:VALARM
END:VEVENT
END:VCALENDAR
EOS
    str.gsub(/\n/, Tokens::CRLF)
  end
  it "converts to icalendar format" do
    cal.to_ical.should eq(ical_str)
    cal.valid?.should eq(true)
  end

  it "is invalid to have an empty alarm" do
    cal = Calendar.new
    cal.event do
      summary "An event"
      alarm do

      end
    end
    cal.valid?.should eq(false)
  end

end