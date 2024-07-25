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

    if((0...10) === @hour and (0...10) === @minute)

      puts "@hour < 10 and @minute < 10"
      "0#{@hour}:0#{@minute}"

    else

      puts "else"
      hour = get_hour(@hour, @minute)
      puts "hour #{hour}"
      minute = get_minute(@minute)
      puts "minute #{minute}"
      return "#{hour}:#{minute}"

    end
  end

  def get_hour(hour, minute)


    if(((0...9) === hour) and (minute >= 0))
      puts "get hour >>> (hour  === (0...9)) and (minute >= 0)"
      hour += minute < 60 ? 0 : get_the_hour_by_minutes(minute)

      "0#{hour}"

    elsif(hour >= 9 and minute >= 0)

      ret_hour = 0

      ret_hour += minute < 60 ? 0 : get_the_hour_by_minutes(minute)

      ret_hour += hour < 24 ? hour : (hour % 24)

      puts "ret_hour #{ret_hour}"

      ret_hour < 10 ? "0#{ret_hour}" : ret_hour

    elsif(((0...10) === hour) and (minute > -60))

    hour == 0 ? "23" : "0#{hour - 1}"

    elsif((hour < 0) and (minute >= 0))
      puts "(hour < 0) and (minute >= 0)"

      ret_hour = 0

      ret_hour += minute > 60 ? 0 : get_the_hour_by_minutes(minute)

      ret_hour += hour.abs < 24 ? (24 + hour) : 24 - (hour.abs % 24)

      # puts hour.abs % 24

      ret_hour < 10 ? "0#{ret_hour}" : ret_hour
    end
  end

  def get_minute(minute)
    if((0...10) === minute)
      puts "get_minute (0...10) === minute"
      "0#{minute}"
    elsif(minute >= 10)
      puts "get_minute minute >= 10"
      minute_ret= 0
      minute_ret = minute < 60 ? minute : (minute % 60)
      (0...10) === minute_ret ? "0#{minute_ret}" : "#{minute_ret}"
    elsif(minute >= -60)
      puts "get_minute minute >= -60"
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


puts Clock.new(hour: -1, minute: 15).to_s
