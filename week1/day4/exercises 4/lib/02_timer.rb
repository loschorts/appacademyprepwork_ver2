class Timer
  attr_accessor :seconds
  def initialize
    @seconds = 0
  end
  def time_string
    @minutes = @seconds % 3600 / 60
    @hours = @seconds / 3600
    "#{self.padded @hours}:#{self.padded @minutes}:#{self.padded @seconds%60}"
  end

  def padded number
    number.to_s.rjust(2, "0")
  end
    
end
