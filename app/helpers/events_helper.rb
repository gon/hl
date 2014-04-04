module EventsHelper
  def friendly_date(datetime, timezone)
    string = ''
    local_datetime = datetime.in_time_zone(timezone)
    local_now = (Time.now.utc).in_time_zone(timezone)

    years_apart = local_datetime.strftime('%Y').to_i - local_now.strftime('%Y').to_i
    months_apart = local_datetime.strftime('%-m').to_i - local_now.strftime('%-m').to_i # month of year 1..12
    weeks_apart = local_datetime.strftime('%U').to_i - local_now.strftime('%U').to_i # week of year 00..53 given a Sunday week
    days_apart = local_datetime.strftime('%-d').to_i - local_now.strftime('%-d').to_i # day of month 1..31

    if years_apart == 0
      if months_apart == 0
        if days_apart == 0
          return 'today'
        elsif days_apart == 1
          return 'tomorrow'
        elsif days_apart > 1
          if weeks_apart == 0
            return local_datetime.strftime('%A') # full weekday name
          elsif weeks_apart == 1
            string += 'next week'
          end
        end
      elsif months_apart == 1
        if days_apart + local_now.end_of_month.strftime('%-d').to_i == 1
          return 'tomorrow'
        else
          string += 'next month '
        end
      end
    elsif years_apart == 1
      # edge cases e.g. local_now is December 31 and local_datetime is tomorrow
    end
    string += " #{local_datetime.strftime('%A')}, #{local_datetime.strftime('%b')} #{local_datetime.strftime('%e')}" # Monday, Jan 1
  end
end
