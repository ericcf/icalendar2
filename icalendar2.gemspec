# -*- encoding: utf-8 -*-

require File.dirname(__FILE__) + "/lib/icalendar2/version"

Gem::Specification.new do |s|
  s.name = "icalendar2"
  s.version = Icalendar2::VERSION
  s.authors = ["Eric Carty-Fickes"]
  s.email = ["ericcf@northwestern.edu"]
  s.description = "Borrows fromt the API used by the icalendar Ruby gem. Outputs iCalendar (RFC 5545) formatted text."
  s.extra_rdoc_files = ["CHANGELOG.md", "README.md"]
  s.files = Dir["lib/**/*.rb"]
  s.homepage = "https://github.com/ericcf/icalendar2"
  s.summary = "iCalendar (RFC 5545) Ruby library"

  s.add_development_dependency("rspec", ["~> 2"])
end
