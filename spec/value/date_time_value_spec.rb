require 'spec_helper'

describe Icalendar2::DateTimeValue do

  it "validates its input" do
    DateTimeValue.new("19960402T010000Z").should be_valid
    DateTimeValue.new("19970714T000000").should be_valid
    DateTimeValue.new("1997071T00000").should_not be_valid
    DateTimeValue.new(DateTime.parse("1996-08-17T13:30:00")).should be_valid
  end

  it "formats its output" do
    DateTimeValue.new("19970714T000000").to_s.should eq("19970714T000000")
    DateTimeValue.new(DateTime.new(2012, 1, 2, 3, 4, 5)).to_s.should eq("20120102T030405")
  end
end
