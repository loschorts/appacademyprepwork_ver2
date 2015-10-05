require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :board, :current_player
  def initialize player_one, player_two
    @board = Board.new()
    @player_one = player_one
    @player_two = player_two
    @current_player = @player_one
    
  end
  
  def play
    until @board.over?
      play_turn
    end
  end
  
  def switch_players!
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end
  
  def play_turn
    @current_player.display
    move = @current_player.get_move
    @board.place_mark(move, @current_player.mark)
    switch_players!
  end
  
end
