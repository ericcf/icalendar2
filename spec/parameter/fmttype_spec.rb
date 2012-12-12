require 'spec_helper'

describe Icalendar2::Parameter::Fmttype do

  it "is valid with valid input" do
    [
      "FMTTYPE=application/msword",
      "FMTTYPE=image/vnd.microsoft.icon"
    ].each do |input|
      Parameter::Fmttype.new(input).should be_valid
    end
  end
end
