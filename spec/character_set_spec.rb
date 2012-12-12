# encoding: utf-8
require 'spec_helper'

describe "output iCalendar streams are UTF-8 encoded" do

  subject { Calendar.new }

  its('to_ical.encoding.name') { should eq("UTF-8") }
end

describe "UTF-8 stream input" do

  let(:utf8_cal) { File.open(File.join(File.dirname(__FILE__), 'fixtures', 'utf8_calendar.ics')) }

  it "is parsed successfully" do
    calendars = Parser.new(utf8_cal).parse
    calendars.first.events.first.uid.value.to_s.should eq('ði ıntəˈnæʃən')
  end
end
