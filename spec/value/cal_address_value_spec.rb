require 'spec_helper'
require 'uri'

describe Icalendar2::CalAddressValue do

  it "validates its input" do
    [
      "ftp://ftp.is.co.za/rfc/rfc1808.txt",
      "http://www.ietf.org/rfc/rfc2396.txt",
      "ldap://[2001:db8::7]/c=GB?objectClass?one",
      "mailto:John.Doe@example.com",
      "news:comp.infosystems.www.servers.unix",
      "tel:+1-816-555-1212",
      "telnet://192.0.2.16:80/",
      "urn:oasis:names:specification:docbook:dtd:xml:4.1.2",
      URI::MailTo.build(['joe@example.com', 'subject=Ruby'])
    ].each do |uri|
      CalAddressValue.new(uri).should be_valid
    end

    [
      "foo bar",
      "12345",
      nil,
      ""
    ].each do |xuri|
      CalAddressValue.new(xuri).should_not be_valid
    end
  end
end
