class Clock
  def initialize(hour: 0, minute: 0)
    total_minutes = hour * 60 + minute
    @time = total_minutes % (24 * 60)
  end

  def +(other)
    Clock.new(minute: @time + other.total_minutes)
  end

  def -(other)
    Clock.new(minute: @time - other.total_minutes)
  end

  def total_minutes
    @time
  end

  def to_s
    extra_hours, minute = @time.divmod(60)
    hour = extra_hours % 24
    format('%02d:%02d', hour, minute)
  end

  def ==(other)
    return false unless other.is_a?(Clock)
    @time == other.total_minutes
  end
end

clock = Clock.new(hour: 10, minute: 3)
puts (clock + Clock.new(minute: 70)).to_s
