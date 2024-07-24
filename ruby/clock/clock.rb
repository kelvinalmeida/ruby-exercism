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

    if((@hour < 10 and @minute < 10) and (@minute >= 0))

      puts "@hour < 10 and @minute < 10"
      "0#{@hour}:0#{@minute}"

    elsif(@hour > 0)

      puts "@hour > 0"
      hour = get_hour(@hour, @minute)
      puts "hour #{hour}"
      minute = get_minute(@minute)
      puts "minute #{minute}"
      return "#{hour}:#{minute}"

    end
  end

  def get_hour(hour, minute)


    if((hour >= 0 and hour < 9) and (minute >= 0))

      hour += minute < 60 ? 0 : get_the_hour_by_minutes(minute)

      "0#{hour}"

    elsif(hour >= 9 and minute >= 0)

      ret_hour = 0

      ret_hour += minute < 60 ? 0 : get_the_hour_by_minutes(minute)

      ret_hour += hour < 24 ? hour : (hour % 24)

      puts "ret_hour #{ret_hour}"

      ret_hour < 10 ? "0#{ret_hour}" : ret_hour

    elsif((hour > 0) and (minute > -60))
      ret_hour = hour - 1
      "0#{ret_hour}"

    # elsif((hour < 0) and (minute > -60))
    #   ret_hour = hour - 1
    #   "0#{ret_hour}"
    end
  end

  def get_minute(minute)
    if(minute >= 0 and minute < 60)
      "0#{minute}"
    elsif(minute >= 60)
      minute = (minute % 60)
      minute < 10 ? "0#{minute}" : minute
    elsif(minute >= -60)
      ret_min = 60 + minute
      ret_min < 10 ? "0#{ret_min}" : ret_min
    end
  end


  def get_the_hour_by_minutes(minutes)

    hour = 0

    if(minutes >= 60)
      hour += minutes / 60
    end

    if(hour > 23)
      hour = hour % 24
    end

    hour

  end
end


Clock.new(hour: 1, minute: -40).to_s
