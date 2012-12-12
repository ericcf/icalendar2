require 'spec_helper'

describe Icalendar2::Component::Base do

  class FooComponent < Component::Base
    requires :exactly_one => [:uid]
    accepts :one_or_more => [:categories]
  end

  describe ".set_property" do

    it "accepts expected properties" do
      expect { FooComponent.new.set_property(:categories, ["foo"]) }.to_not raise_error
    end

    it "raises an exception for unexpected properties" do
      expect { FooComponent.new.set_property(:baz, "bar") }.to raise_error
    end
  end

  describe "required properties" do

    it "when missing register as invalid" do
      FooComponent.new.valid?.should be_false
    end

    it "when present register as valid" do
      component = FooComponent.new
      component.uid = "abc123"
      component.valid?.should be_true
    end
  end
end
