class Board
  attr_accessor :grid, :count
  # constructors
  def initialize grid = :default
    @grid = grid == :default ? self.class.default_grid : grid
  end

  def self.default_grid
    Array.new(10) {Array.new(10)}
  end  
  
  #grid sugar
  def [] row, col
    @grid[row][col]
  end
  
  def []= row, col, object
    @grid[row][col] = object
  end
  
  #inspect methods
  def count object = :s
    instances = 0
    @grid.each do |row|
      row.each do |spot|
        instances += 1 if spot == object
      end
    end
    instances
  end
  
  def length
    @grid.length
  end
  
  def empty? pos = :all
    if pos.class == Array
      self[*pos].nil?
    else
      @grid.each do |row|
        row.each do |spot|
          return false unless spot.nil?
        end
      end
      true
    end
  end
  
  def full?
    @grid.each do |row|
      row.each do |spot|
        return false if spot.nil?
      end
    end
    true
  end
  
  def empty_positions
    empties = []
    @grid.length.times do |row|
      @grid[0].length.times do |col|
        empties << [row, col] if empty?([row, col])
      end
    end
    empties
  end
  def won?
    count == 0 ? true : false
  end
  
  #act methods
  def place_random_ship object = :s
    raise 'no empty positions' if empty_positions.empty?
    self[*empty_positions.sample] = object
  end
  

  
  #non-spec'd methods
  def display
    @grid.each {|row| p row}
  end
  
  def populate_grid num, object = :s
    num.times {place_random_ship_object object}
  end
  
  def in_range?(pos)
    row, col = *pos
    return true if row >= 0 && col >= 0 && 
                  row < grid.length && col < grid[0].length
    false
  end

end

if __FILE__ == $0
  board = Board.new
  board[0,1] = :s
  board.display
end