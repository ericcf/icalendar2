require 'spec_helper'

describe Icalendar2::BooleanValue do

  it "validates its input" do
    BooleanValue.new("True").should be_valid
    BooleanValue.new("false").should be_valid
    BooleanValue.new("inconclusive").should_not be_valid
    BooleanValue.new(0).should_not be_valid
  end
end
