require 'spec_helper'

describe Icalendar2::BinaryValue do

  it "validates its input" do
    BinaryValue.new("abcdaa==").should be_valid
    BinaryValue.new("a/cd+a==").should be_valid
    BinaryValue.new("123=").should be_valid
    BinaryValue.new("345").should_not be_valid
    BinaryValue.new("&").should_not be_valid
  end
end
