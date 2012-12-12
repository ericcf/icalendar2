require 'spec_helper'

describe Icalendar2::LatLonValue do

  it "is valid with valid input" do
    [
      "37.386013;-122.082932",
      "0.0;0.0"
    ].each do |input|
      LatLonValue.new(input).should be_valid
    end
  end

  it "is invalid with invalid input" do
    [
      nil,
      "37.3",
      ";1.0"
    ].each do |input|
      LatLonValue.new(input).should_not be_valid
    end
  end
end
