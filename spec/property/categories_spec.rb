require 'spec_helper'

describe Icalendar2::Property::Categories do

  it "converts to ical" do
    Property::Categories.new('a, b, c').to_ical.
      should eq("CATEGORIES:a,b,c#{Tokens::CRLF}")
    Property::Categories.new(['a', 'b', 'c']).to_ical.
      should eq("CATEGORIES:a,b,c#{Tokens::CRLF}")
  end
end
