require 'spec_helper'

describe Icalendar2::TimeValue do

  it "validates its input" do
    Icalendar2::TimeValue.new("000000").should be_valid
    Icalendar2::TimeValue.new("235960").should be_valid
    Icalendar2::TimeValue.new("123456Z").should be_valid
    Icalendar2::TimeValue.new("123456T").should_not be_valid
    Icalendar2::TimeValue.new("240000").should_not be_valid
    Icalendar2::TimeValue.new("006000").should_not be_valid
    Icalendar2::TimeValue.new("000061").should_not be_valid
  end
end
