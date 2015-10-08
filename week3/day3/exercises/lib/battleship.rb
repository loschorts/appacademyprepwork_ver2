require './board'
require './player'

class BattleshipGame
  attr_accessor :board, :board_one, :player, :current_player, :boards, :turn
  
  def initialize player_one = HumanPlayer.new("player_one"), board_one = Board.new
    
    @player_one = player_one
    @current_player = @player_one
    @board_one = board_one
    @boards = {@player_one => @board_one}
    @board = @boards[@current_player]
    @turn = 0
  end
  
  def play
    play_turn until game_over?
    puts 'won' if board.won?
    puts 'full' if board.full?
  end
  
  def play_turn
    @turn += 1
    display_status(hide: false)
    attack(current_player.get_play)
  end
  
  def attack(pos)
    field = boards[current_player]
    if field.empty? pos
      field[*pos] = :x
    elsif field[*pos] == :s
        field[*pos] = :hit 
    else
        puts 'already tried that spot'
    end
  end
  
  def count
    board.count
  end
  
  def game_over?
    return false if turn == 0
    board.won? ? true : false
  end

  def display_status(options = {hide: true})
    display = board.display
  end
end

if __FILE__ == $0
  game = BattleshipGame.new()
  5.times {|col| game.board[0,col] = :s}
  game.play
  
end