require 'spec_helper'

describe Icalendar2::TextValue do

  it "escapes its input" do
    {
      "abc\\" => "abc\\\\",
      "foo;bar" => "foo\\;bar",
      "Lorem, ipsum!\r" => "Lorem\\, ipsum!\n",
      "It was the best of times,\r\nit was the blurst of times." => "It was the best of times\\,\nit was the blurst of times."
    }.each do |input, output|
      TextValue.new(input).to_s.should eq(output)
    end
  end
end
