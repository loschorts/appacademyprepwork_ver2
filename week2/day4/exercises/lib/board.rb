require 'byebug'

class Board
  attr_accessor :grid, :marks

  def initialize grid = Array.new(3) { Array.new(3) }
    @grid = grid
    @marks = []
  end
  
  def clone
    clone = Board.new()
    clone.marks = @marks.dup
    
    @grid.length.times do |row|
      @grid[0].length.times do |col|
        clone[row, col] = self[row, col]
      end
    end
    
    clone
  end
  
  def display mode = :human
    case mode
    when :human
      @grid.length.times do |r|
        puts row r
      end
    when :computer
      self
    end
  end

  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, mark)
    @grid[row][col] = mark
    @marks << mark unless @marks.include?(mark)
    
  end
  
  def place_mark pos, mark
    if self[*pos].nil?
      self[*pos] = mark
    else
      raise 'position not empty'
    end
  end
  
  def empty? pos
    self[*pos].nil?
  end
  
  def winner
    lines = []
    (0..2).each do |i|
      lines << self.row(i)
      lines << self.col(i)
    end
    lines << [self[0,0], self[1,1], self[2,2]]
    lines << [self[0,2], self[1,1], self[2,0]]
    
    lines.each do |line|
      return check_line(line) unless check_line(line) == false
    end
    
    nil
  end
  
  def over?
    return true if board_full?
    winner == nil ? false : true
  end
  
  def board_full?
    (0..2).each do |row|
      (0..2).each do |col|
        return false if self[row, col].nil?
      end
    end
    true
  end
  
  def row i
    @grid[i]
  end
  
  def col i
    (0...@grid.length).map{|r| self[r, i]} 
  end
  
  def check_line line
    @marks.each do |mark|
      return mark if same?(mark, line)
    end
    false
  end
  
  def same? check, squares
    squares.each do |square|
      return false if check != square
    end
    true
  end
end

if __FILE__ == $0
  my_board = Board.new
  clone_board = my_board.clone
  my_board.place_mark([0,0], :DEATH)
  p my_board, clone_board
end
