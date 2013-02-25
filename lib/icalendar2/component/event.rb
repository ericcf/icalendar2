module Icalendar2
  # See http://tools.ietf.org/html/rfc5545#section-3.6.1
  class Event < Component::Base
    VALUE = "VEVENT"

    requires :exactly_one => [:dtstamp, :uid]
    accepts :exactly_one => [:dtstart, :klass, :created, :description, :geo,
      :last_mod, :location, :organizer, :priority, :sequence, :status, :summary,
      :transp, :url, :recurid, :dtend, :duration],
      :one_or_more => [:rrule, :attach, :attendee, :categories, :comment,
      :contact, :exdate, :rstatus, :related_to, :resources, :rdate]

    def initialize
      super
      self.uid = new_uid
      self.dtstamp = new_timestamp
    end

    # Add a new alarm(s) in a block
    def alarm(&block)
      a = Alarm.new
      self.add_component a
      a.instance_eval(&block)

      a
    end

    def alarms
      @components[:alarms]
    end

    def to_ical
      str = "#{Tokens::COMPONENT_BEGIN}:#{VALUE}#{Tokens::CRLF}"
      str << properties_to_ical
      str << alarm_to_ical
      str << "#{Tokens::COMPONENT_END}:#{VALUE}#{Tokens::CRLF}"
    end

    def valid?
      alarms ? alarms.all?(&:valid?) : true
    end

    private

    def alarm_to_ical
      str = ""
      alarms.each do |a|
        str << a.to_ical
      end if alarms

      str
    end
  end
end
