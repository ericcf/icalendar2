require 'spec_helper'

describe "Create a calendar with one event" do

  let(:cal) { Calendar.new }

  context "block style" do

    let(:ical_str) do
  str = <<EOS
BEGIN:VCALENDAR
CALSCALE:GREGORIAN
METHOD:PUBLISH
PRODID:-//ABC Corporation//NONSGML My Product//EN
VERSION:2.0
BEGIN:VEVENT
DESCRIPTION:Thanksgiving dinner with the family.
DTEND:20121123
DTSTAMP:20121010T073000
DTSTART:20121122
CLASS:PRIVATE
SUMMARY:Eating turkey.
UID:12345
END:VEVENT
END:VCALENDAR
EOS
      str.gsub(/\n/, Tokens::CRLF)
    end

    before do
      cal.method_property "PUBLISH"
      cal.calscale "GREGORIAN"
      cal.version "2.0"
      cal.prodid "-//ABC Corporation//NONSGML My Product//EN"
      cal.event do
        uid         "12345"
        dtstamp     DateTime.new(2012, 10, 10, 7, 30)
        dtstart     Date.new(2012, 11, 22)
        dtend       Date.new(2012, 11, 23)
        summary     "Eating turkey."
        description "Thanksgiving dinner with the family."
        klass       "PRIVATE"
      end
    end

    it "outputs iCalendar formatted text" do
      cal.to_ical.should eq(ical_str)
    end
  end

  context "method style" do

    let(:ical_str) do
      str = <<EOS
BEGIN:VCALENDAR
BEGIN:VEVENT
DTSTAMP:20120909T090000
DTSTART:20060623T083000
SUMMARY:A great event!
UID:54321
END:VEVENT
END:VCALENDAR
EOS
      str.gsub(/\n/, Tokens::CRLF)
    end

    before do
      event = Event.new
      event.uid = "54321"
      event.dtstamp = DateTime.new(2012, 9, 9, 9)
      event.dtstart = DateTime.civil(2006, 6, 23, 8, 30)
      event.summary = "A great event!"
      cal.add_event(event)
    end

    it "outputs iCalendar formatted text" do
      cal.to_ical.should eq(ical_str)
    end
  end
end
