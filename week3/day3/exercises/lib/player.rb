class HumanPlayer
  attr_reader :name
  def initialize name
    @name = name
  end
  
  def get_play
    print '@: '
    input = gets.chomp.split(",")
    row, col = *input.map {|x| x.strip.to_i}
    [row, col]
  end
  
end

if __FILE__ == $0
  p HumanPlayer.new("chad").get_play
end

class ComputerPlayer
end