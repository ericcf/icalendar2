require 'spec_helper'

describe "README" do

  it "simple example works" do
    calendar = Calendar.new
    calendar.event do
      dtstart     Date.new(2012, 12, 25)
      dtend       Date.new(2012, 1, 5)
      summary     "12 days of Christmas."
      description "Eat lots of cookies."
    end
    calendar.should be_valid

    calendars = Parser.new(calendar.to_ical).parse
    calendars.size.should eq(1)
    calendars.first.should be_valid
  end
end
