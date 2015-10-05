require 'byebug'

class ComputerPlayer
  attr_accessor :name, :board, :mark
  def initialize name
    @name = name
    @mark = :O
  end
  
  def display board
    @board = board
    @board.display(:computer)
  end
  def get_move(board = @board)
    @board = board
    return possible_winner? unless possible_winner?.nil?
    puts 'wtf'
    get_empties.sample
  end
  
  def possible_winner?
    get_empties.each do |pos|
      sim_board = @board.clone
      sim_board.place_mark(pos, @mark)
      return pos if sim_board.winner
    end
    nil
  end
  
  def get_empties
    empties = []
    @board.grid.length.times do |row|
      @board.grid[0].length.times do |col|
        empties << [row,col] if @board[row,col].nil?
      end
    end
    empties
  end

end

if __FILE__ == $0
  comp = ComputerPlayer.new("comp)")
  board = Board.new
  board.place_mark([0,0], :O)
  board.place_mark([0,1], :O)
  comp.board = board
  p comp.get_empties
  p comp.possible_winner?
  p comp.get_move
end
