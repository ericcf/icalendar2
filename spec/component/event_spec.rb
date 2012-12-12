require 'spec_helper'

describe Icalendar2::Event do

  subject { Event.new }

  let(:ical_str) do
str = <<EOS
BEGIN:VEVENT
UID:12345
DTSTAMP:20121124T081500
DTSTART:20121203T010203
END:VEVENT
EOS
    str.gsub(/\n/, Tokens::CRLF)
  end

  it "converts to iCalendar format" do
    subject.dtstamp = DateTime.new(2012, 11, 24, 8, 15, 0)
    subject.uid = "12345"
    subject.dtstart = DateTime.new(2012, 12, 3, 1, 2, 3)
    subject.to_ical.should eq(ical_str)
  end
end
