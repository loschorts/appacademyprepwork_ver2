class HumanPlayer
  attr_accessor :name, :board
  def initialize name
    @name = name
    @mark = :X
  end
  
  def display board = @board
    board.display :human
  end
  def get_move
    print "Where (row, col)? "
    gets.chomp.split(', ').map(&:to_i)
  end
end
