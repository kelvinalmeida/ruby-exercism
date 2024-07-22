=begin
Write your code for the 'Clock' exercise in this file. Make the tests in
`clock_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/clock` directory.
=end

class Clock
  def initialize(hour: 0, minute: 0)
    @hour = hour
    @minute = minute
  end

  def to_s

    # hour = 0

    if(@hour < 10 and @minute < 10)
      "0#{@hour}:0#{@minute}"
    else
      hour = get_hour(@hour, @minute)
      puts "hour #{hour}"
      minute = get_minute(@minute)
      puts "minute #{minute}"
      # puts "#{hour}:#{minute}"

      return "#{hour}:#{minute}"
    end
  end

  def get_hour(hour, minute)

    if(hour >= 0 and hour < 23)

      if(minute > 60)
        hour += minute / 60
      end

      "0#{hour}"

    elsif(hour >= 23)

      ret_hour = 0

      if(minute > 60)
        ret_hour = minute / 60
      end
      puts "get_hour_1 #{hour}"

      ret_hour += (hour % 24)

      puts "ret_hour #{ret_hour}"

      if (ret_hour < 10)
        "0#{ret_hour}"
      else
        ret_hour
      end
    end
  end

  def get_minute(minute)
    if(minute >= 0 and minute < 60)
      "0#{minute}"
    elsif(minute >= 60)
      minute = (minute % 60)
      if (minute < 10)
        "0#{minute}"
      else
        minute
      end
    end
  end
end


Clock.new(hour: 11, minute: 9).to_s
