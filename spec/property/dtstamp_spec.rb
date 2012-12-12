require 'spec_helper'

describe Icalendar2::Property::Dtstamp do

  it "converts to ical" do
    Icalendar2::Property::Dtstamp.new("19970714T000000").to_ical
      .should eq("DTSTAMP:19970714T000000#{Icalendar2::Tokens::CRLF}")
  end
end
