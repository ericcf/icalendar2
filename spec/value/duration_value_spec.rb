require 'spec_helper'

describe Icalendar2::DurationValue do

  it "validates its input" do
    Icalendar2::DurationValue.new("P15DT5H0M20S").should be_valid
    Icalendar2::DurationValue.new("P7W").should be_valid
  end
end
