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
    normalize_time
  end

  def +(other)
    Clock.new(hour: @hour + other.get_hours, minute: @minute + other.get_minutes)
  end

  def get_minutes
    @minute
  end

  def get_hours
    @hour
  end

  def to_s
    "%02d:%02d" % [@hour, @minute]
  end

  def normalize_time
    @hour =  (@hour + (@minute / 60)) % 24
    @minute = @minute % 60
  end
end

clock = Clock.new(hour: 10, minute: 3)
(clock + Clock.new(minute: 70)).to_s
