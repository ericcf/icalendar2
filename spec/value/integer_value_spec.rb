require 'spec_helper'

describe Icalendar2::IntegerValue do

  it "permits valid input" do
    [
      1234567890,
      "1234567890",
      -1234567890,
      "-1234567890",
      +1234567890,
      "+1234567890",
      432109876,
      "432109876"
    ].each do |v|
      Icalendar2::IntegerValue.new(v).should be_valid
    end
  end

  it "prohibits invalid input" do
    [
      nil,
      false,
      1.5,
      "-4.9",
      "2/3",
      "abc"
    ].each do |v|
      Icalendar2::IntegerValue.new(v).should_not be_valid
    end
  end
end
