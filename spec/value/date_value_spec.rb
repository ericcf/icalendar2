require 'spec_helper'

describe Icalendar2::DateValue do

  it "validates its input" do
    Icalendar2::DateValue.new("19970714").should be_valid
    Icalendar2::DateValue.new("99991231").should be_valid
    Icalendar2::DateValue.new("12341301").should_not be_valid
    Icalendar2::DateValue.new("12341032").should_not be_valid
    Icalendar2::DateValue.new("123401010").should_not be_valid
  end
end
