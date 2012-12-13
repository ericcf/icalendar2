require 'spec_helper'

describe Icalendar2::Property::Dtend do

  let(:dtend) { Property::Dtend }

  it "converts to ical" do
    dtend.new("20120304T120000").to_ical.
      should eq("DTEND:20120304T120000#{Tokens::CRLF}")
  end

  it "is valid with a date string" do
    expect { dtend.new("20121231") }.to_not raise_error
  end

  it "accepts params" do
    dtend.new(Date.new(2012, 1, 2), { "VALUE" => "DATE" }).to_ical.
      should eq("DTEND;VALUE=DATE:20120102#{Tokens::CRLF}")
  end
end
