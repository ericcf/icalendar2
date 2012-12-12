require 'spec_helper'

describe Icalendar2::Tokens do

  let(:t) { Icalendar2::Tokens }

  describe "VALUE_CHAR" do

    it { ("0123 asdf QWERTY +_)(*" =~ /^#{t::VALUE_CHAR}*$/).should_not be_nil }
  end
end
