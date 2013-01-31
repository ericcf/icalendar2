require 'spec_helper'

describe Icalendar2::Property::Created do

  it "converts to ical" do
    Icalendar2::Property::Created.new("19970714T000000").to_ical.
      should eq("CREATED:19970714T000000#{Icalendar2::Tokens::CRLF}")
  end
end
