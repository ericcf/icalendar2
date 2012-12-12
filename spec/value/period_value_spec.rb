require 'spec_helper'

describe Icalendar2::PeriodValue do

  it "is valid with valid input" do
    [
      "19970101T180000Z/19970102T070000Z",
      "19970101T180000Z/PT5H30M"
    ].each do |input|
      PeriodValue.new(input).should be_valid
    end
  end

  it "is invalid with invalid input" do
    [
      nil,
      "19970101T180000Z",
      "PT5H30M/PT5H30M",
    ].each do |input|
      PeriodValue.new(input).should_not be_valid
    end
  end
end
