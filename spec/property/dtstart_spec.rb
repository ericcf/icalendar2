require 'spec_helper'

describe Icalendar2::Property::Dtstart do

  it "converts to ical" do
    Icalendar2::Property::Dtstart.new("20120203T120000").to_ical
      .should eq("DTSTART:20120203T120000#{Icalendar2::Tokens::CRLF}")
  end
end
