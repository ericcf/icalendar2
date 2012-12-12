require 'spec_helper'

describe Icalendar2::Parser do

  let(:test_file) { File.open(File.join(File.dirname(__FILE__), 'fixtures', 'single_event.ics')) }
  let(:test_file_2) { File.open(File.join(File.dirname(__FILE__), 'fixtures', 'multiple_events.ics')) }

  describe "initialization" do

    it "does not accept invalid input" do
      expect { Parser.new(nil) }.to raise_error(ArgumentError)
    end

    it "accepts a file" do
      expect { Parser.new(test_file) }.to_not raise_error(ArgumentError)
    end

    it "accepts a string" do
      expect { Parser.new(test_file.read) }.to_not raise_error(ArgumentError)
    end
  end

  describe "parsing simple calendar" do

    before(:all) do
      @calendars = Parser.new(test_file).parse
    end

    it "returns the correct number of calendars" do
      @calendars.size.should eq(1)
      @calendars.first.class.should eq(Calendar)
    end

    it "parses the calendar properties" do
      @calendars.first.version.should eq("2.0")
      @calendars.first.prodid.should eq("bsprodidfortestabc123")
      @calendars.first.calscale.should eq("GREGORIAN")
      @calendars.first.method_property.should eq("REQUEST")
    end

    context "event" do

      let(:event) { @calendars.first.events.first }

      it "parses properties" do
        event.uid.value.to_s.should eq("bsuidfortestabc123")
        event.organizer.value.to_s.should eq("mailto:joebob@random.net")
        event.attachments.size.should eq(2)
        event.attachments.first.value.to_s.should eq("http://example.com/pub/audio-files/ssbanner.aud")
        event.attachments.first.parameters.should eq({ "FMTTYPE" => ["audio/basic"] })
        event.attachments.last.value.to_s.should eq("http://example.com/public/quarterly-report.doc")
        event.klass.value.to_s.should eq("PRIVATE")
        event.priority.value.to_s.should eq("2")
        event.geo.value.to_s.should eq("37.386013;-122.0829322")
        event.dtstart.value.to_s.should eq("20050120T170000")
        event.dtstart.parameters.should eq({ "TZID" => ["US-Mountain"] })
        event.dtend.value.to_s.should eq("20050120T184500")
        event.dtstamp.value.to_s.should eq("20050118T211523Z")
        event.categories_properties.size.should eq(1)
        categories = event.categories_properties.first
        categories.value.map(&:to_s).should eq(["APPLES", "ORANGES", "UNICORNS"])
        exdate = event.exdates.first
        exdate.value.map(&:to_s).should eq(["19960402T010000Z", "19960403T010000Z", "19960404T010000Z"])
      end
    end
  end

  describe "parsing multiple event calendar" do

    before(:all) do
      @calendars = Parser.new(test_file_2).parse
    end

    it "returns the correct number of calendars" do
      @calendars.size.should eq(1)
      @calendars.first.class.should eq(Calendar)
    end

    it "parses all events" do
      @calendars.first.events.size.should eq(3)
    end
  end
end
