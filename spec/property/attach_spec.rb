require 'spec_helper'

describe Icalendar2::Property::Attach do

  it "converts to ical" do
    Property::Attach.new("ftp://example.com/pub/reports/r-960812.ps").to_ical.
      should eq("ATTACH:ftp://example.com/pub/reports/r-960812.ps#{Tokens::CRLF}")
  end

  it "is valid with a binary value" do
    expect { Property::Attach.new("123=") }.to_not raise_error
  end

  it "accepts params" do
    Property::Attach.new("http://abc.123", { "FOO" => "BAR" }).to_ical.
      should eq("ATTACH;FOO=BAR:http://abc.123#{Tokens::CRLF}")
  end
end
