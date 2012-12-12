require 'spec_helper'

describe Icalendar2::UriValue do

  it "validates its input" do
    [
      "ftp://ftp.is.co.za/rfc/rfc1808.txt",
      "http://www.ietf.org/rfc/rfc2396.txt",
      "ldap://[2001:db8::7]/c=GB?objectClass?one",
      "mailto:John.Doe@example.com",
      "news:comp.infosystems.www.servers.unix",
      "tel:+1-816-555-1212",
      "telnet://192.0.2.16:80/",
      "urn:oasis:names:specification:docbook:dtd:xml:4.1.2"
    ].each do |uri|
      UriValue.new(uri).should be_valid
    end
    [
      "3tp://ftp.is.co.za",
      "http://\"example.com",
      "tel:867<5309"
    ].each do |uri|
      UriValue.new(uri).should_not be_valid
    end
  end
end
