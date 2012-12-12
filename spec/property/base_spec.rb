require 'spec_helper'

describe Icalendar2::Property::Base do

  class DummyTextProperty < Property::Base
    name "DUMMY"
    value :types => [:text]
  end

  describe "folding" do

    let(:long_text) { "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam dignissim egestas magna quis sollicitudin. Aenean quis enim metus." }

    it "should fold lines longer than 75 characters" do
      DummyTextProperty.new(long_text).to_ical
        .should eq("DUMMY:Lorem ipsum dolor sit amet\\, consectetur adipiscing elit. Nullam dign\r\n issim egestas magna quis sollicitudin. Aenean quis enim metus.\r\n")
    end
  end

  class DummyMultiProperty < Property::Base
    name "DUMMY_MULTI"
    value :types => [:boolean, :integer]
  end

  describe "valid types" do

    it "should allow specified value types" do
      expect { DummyMultiProperty.new("true") }.to_not raise_error
      expect { DummyMultiProperty.new("89") }.to_not raise_error
    end

    it "should not allow unspecified value types" do
      expect { DummyMultiProperty.new("1.3") }.to raise_error
      expect { DummyMultiProperty.new("abcde") }.to raise_error
    end
  end
end
