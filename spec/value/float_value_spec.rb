require 'spec_helper'

describe Icalendar2::FloatValue do

  it "permits valid input" do
    [
      1000000.0000001,
      "1000000.0000001",
      1.333,
      "1.333",
      -3.14,
      "-3.14"
    ].each do |v|
      Icalendar2::FloatValue.new(v).should be_valid
    end
  end

  it "prohibits invalid input" do
    [
      nil,
      true,
      "abcd",
      "*",
      "1/2"
    ].each do |v|
      Icalendar2::FloatValue.new(v).should_not be_valid
    end
  end
end
