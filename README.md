# icalendar2 - generate, consume and validate iCalendar feeds

[![Build Status](https://travis-ci.org/ericcf/icalendar2.png?branch=master)](https://travis-ci.org/ericcf/icalendar2)

## Warning

This is NOT production ready yet. It has not been extensively tested, and you
use it at your own risk.

## Installation

If you want to jump right in and try it out, here's how you install it:

``` bash
gem install icalendar2
```

Website: https://github.com/ericcf/icalendar2

## Introduction

icalendar2 is a Ruby library for parsing, manipulating and generating iCalendar
objects as described in RFC 5545. Its API is intended to be mostly compatible
with that of the icalendar gem (https://github.com/sdague/icalendar), at least
initially.

For example:

``` ruby
require 'rubygems'
require 'icalendar2'
include Icalendar2

calendar = Calendar.new
calendar.event do
  dtstart     Date.new(2012, 12, 25)
  dtend       Date.new(2012, 1, 5)
  summary     "12 days of Christmas."
  description "Eat lots of cookies."
end
calendar.valid? # true
puts calendar.to_ical
# BEGIN:VCALENDAR
# BEGIN:VEVENT
# UID:2012-12-12T10:12:45-06:00_253060006@example.com
# DTSTAMP:20121212T101245
# DTSTART:20121225
# DTEND:20120105
# SUMMARY:12 days of Christmas.
# DESCRIPTION:Eat lots of cookies.
# END:VEVENT
# END:VCALENDAR

calendars = Parser.new(calendar.to_ical).parse
calendars.size # 1
calendars.first.valid? # true
```

## Timezones
```ruby
calendar = Calendar.new
  calendar.timezone do
    tzid  "Europe/London"
    daylight do
      tzoffsetfrom  '+0000'
      rrule         'FREQ=YEARLY;BYMONTH=3;BYDAY=-1SU'
      dtstart       DateTime.new(1981, 03, 29, 01, 00, 00)
      tzname        'BST'
      tzoffsetto    '+0100'
    end
    standard do
      tzoffsetfrom  '+0100'
      rrule         'FREQ=YEARLY;BYMONTH=10;BYDAY=-1SU'
      dtstart       DateTime.new(1996, 10, 27, 02, 00, 00)
      tzname        'GMT'
      tzoffsetto    '+0000'
    end
  end
end
```

## Alarms

icalendar2 currently has limited support for alarms. Email and audio actions are not
yet available as the necessary properties are missing.
Creating an alarm for an event is relatively straightforward and you can have more than
one alarm:

```ruby
calendar = Calendar.new
calendar.event do
  summary "Zombie Apocalypse"
  alarm do
    trigger "-PT15M", {"VALUE" => "DURATION"}
    action "DISPLAY"
    description "Run!"
  end
  alarm do
    trigger "-PT0S"
    action "DISPLAY"
    description "Get eaten"
  end
end
puts calendar.to_ical
# BEGIN:VCALENDAR
# BEGIN:VEVENT
# SUMMARY:ALARMING
# BEGIN:VALARM
# ACTION:DISPLAY
# DESCRIPTION:Run!
# TRIGGER;VALUE=DURATION:-PT15M
# END:VALARM
# BEGIN:VALARM
# ACTION:DISPLAY
# DESCRIPTION:Get eaten
# TRIGGER:-PT0S
# END:VALARM
# END:VEVENT
# END:VCALENDAR
```

## Improvements over/differences with icalendar gem

While this gem is based on (and borrows some code from) the icalendar gem, it
also improves on it in several key areas:
* No monkey patching of core Ruby classes such as String for conversions
* Better separation of concerns makes it easier to test and extend
* Validates calendars and pinpoints errors
* Uses RSpec for tests

## Testing

To run the icalendar2 tests ensure that the rspec gem is installed, and run:

``` bash
rake test
```

## Building the gem

``` bash
gem build icalendar2.gemspec
```

## Contributions

I need your help to make this library better. Please use the GitHub issue
tracker for feature requests and bug reports. The more detail you can provide
the better.

## License

As this is based on the icalendar gem, which employs the Ruby licence, this too
falls under that license: http://www.ruby-lang.org/en/about/license.txt
