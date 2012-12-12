module Icalendar2
  require 'stringio'

  class Parser

    def initialize(source)
      if source.respond_to?(:gets)
        @file = source
      elsif !source.nil? && source.respond_to?(:to_s)
        @file = StringIO.new(source.to_s, 'r')
      else
        raise ArgumentError, "#{self.class}.new must be called with an IO-like object or a path"
      end

      @previous_line = next_line_of_file
    end

    # Returns an iCalendar stream (collection of iCalendar objects).
    def parse
      calendars = []

      while (line = next_multiline)
        fields = parse_line(line)
        if fields[:name] == Tokens::COMPONENT_BEGIN && fields[:value] == Calendar::VALUE
          calendar = parse_calendar
          calendars << calendar
        end
      end

      calendars
    end

    private

    def parse_calendar
      calendar = Calendar.new

      while (line = next_multiline)
        fields = parse_line(line)

        name, value = fields[:name].upcase, fields[:value]
        if name == Tokens::COMPONENT_BEGIN
          component_factory = Component.get_factory(value)
          if component_factory.nil?
            raise "Unable to find component: #{value}"
          end
          calendar.add_component parse_component(component_factory.new)
        else
          calendar.set_property(name, value, fields[:params])
        end
      end

      calendar
    end

    def parse_component(component)
      while (line = next_multiline)
        fields = parse_line(line)
        name = fields[:name].downcase
        break if name.upcase == Tokens::COMPONENT_END
        params, value = fields[:params], fields[:value]
        component.set_property(name, value, params)
      end

      component
    end

    CONTINUED_LINE = /^[ \t]/
    NAME =           "(?:#{Tokens::IANA_TOKEN}|#{Tokens::X_NAME})"
    PARAM_NAME =     "(?:#{Tokens::IANA_TOKEN}|#{Tokens::X_NAME})"
    PARAM =          "(?:#{PARAM_NAME}=#{Tokens::PARAM_VALUE}(?:,#{Tokens::PARAM_VALUE})*)"
    PARAM_CAPTURE =  "(#{PARAM_NAME})=(#{Tokens::PARAM_VALUE}(?:,#{Tokens::PARAM_VALUE})*)"
    CONTENT_LINE =   /^(#{NAME})(;#{PARAM})*:(#{Tokens::VALUE_CHAR}*)/

    def next_line_of_file
      line = @file.gets
      line.chomp! unless line.nil?
    end

    def next_multiline
      line = @previous_line

      if line.nil?
        return nil
      end

      loop do
        next_line = next_line_of_file

        if next_line =~ CONTINUED_LINE
          line << next_line[1, next_line.size]
        elsif next_line.nil? || next_line.size > 0
          @previous_line = next_line
          break
        end
      end

      line
    end

    def parse_line(line)
      unless line =~ %r{#{CONTENT_LINE}}i
        raise "Invalid line in calendar string: #{line}"
      end

      name = $1.upcase
      value = unescape($3)
      params = parse_params_str($2)

      { :name => name, :value => value, :params => params }
    end

    def unescape(str)
      str.gsub("\\;", ";").gsub("\\,", ",").gsub("\\n", "\n").gsub("\\\\", "\\")
    end

    def parse_params_str(params_str)
      params = {}
      if !params_str.nil? && params_str.size > 1
        params_str.scan(/#{PARAM_CAPTURE}/) do
          name = $1
          values = $2

          params[name] ||= []
          values.scan(/(#{Tokens::PARAM_VALUE})/) do
            if $1.size > 0
              params[name] << $1
            end
          end
        end
      end

      params
    end
  end
end
