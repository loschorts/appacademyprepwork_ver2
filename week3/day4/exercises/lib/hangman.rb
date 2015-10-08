require 'byebug'

$AS_MAIN = __FILE__ == $PROGRAM_NAME

class Hangman
  attr_reader :guesser, :referee
  attr_accessor :board, :misses
  
  def initialize players
    @guesser = players[:guesser]
    @referee = players[:referee]
    puts "Guesser: #{guesser}"
    puts "Referee: #{referee}"
    puts ""
    self
  end
  
  def setup
    @misses = 10
    @board = "-" * guesser.register_secret_length(referee.pick_secret_word)
    self
  end
  
  def take_turn
    
    if $AS_MAIN
      p referee.secret_word
      p guesser.view
      p guesser.right
      p guesser.wrong
    end
    
    show_status
    update_board(*get_and_apply_guess)
    self
  end
  
  def get_and_apply_guess
    guess = guesser.guess(@board)
    hits = referee.check_guess guess
    guesser.handle_response guess, hits

    puts "Guesser guessed: #{guesser.prior_guesses.last}\n\n" if $AS_MAIN
    return guess, hits
  end
  
  def update_board guess, hits
    @misses -=1 if hits.empty?
    hits.each {|hit| @board[hit] = guess}
    self
  end
  
  def show_status
    puts "Misses Left: #{@misses}"
    puts "Already Guessed: #{guesser.prior_guesses.inspect}" if $AS_MAIN
    puts "Board: #{@board}"
    puts ""
    self
  end
  
  def play
    take_turn until over?
    puts 'Game Over' if over?
    puts "Word was: #{referee.secret_word}" unless won?
    if won?
      puts "Guesser won."
      puts "Word was '#{referee.secret_word}'."
    end
    self
  end
  
  def over?
    @misses < 1 || won?
  end
  
  def won?
    @board.split(//).include?("-") ? false : true
  end
  
end

class ComputerPlayer
  attr_reader :dictionary
  attr_accessor :secret_word, :view, :prior_guesses, :wrong, :right
  
  def initialize dictionary
    @dictionary = dictionary
    @view = ""
    @prior_guesses = []
    @wrong = []
    @right = []
  end
  
  # referee functions

  def pick_secret_word
    @secret_word = dictionary.sample
    @secret_word.length
  end
  
  def check_guess letter
    secret_word.split(//).each_with_index.select {|el, index| el == letter}.map {|i| i[1]}
  end
  
  # guesser functions
  
  def register_secret_length length
    @view = "-" * length
    length
  end
  
  def guess board
    guess_pool = ('a'..'z').map{|i|i}
    guess = guess_pool.sample
    @prior_guesses << guess
    guess_pool.delete(guess)
    guess
  end
  
  def handle_response guess, hits
    if hits.empty?
      @wrong << guess unless @wrong.include?(guess)
    else
      hits.each {|hit| view[hit] = guess}
      @right << guess unless @wrong.include?(guess)
    end
    self
  end
  
  def look board
    @view = board
  end
  
end

class HumanPlayer < ComputerPlayer
  def guess board
    print "Enter Guess: "
    guess = gets.chomp
    @prior_guesses << guess
    guess
  end
  
  def pick_secret_word
    @secret_word = "a human choice."
    puts "Think of a fucking word..."
    print "How long is it: "
    gets.chomp.to_i
  end
  
  def check_guess letter
    puts "The computer guessed #{letter}."
    print "What indices does it appear at: [Enter] if none"
    gets.chomp.split(/\W+/).map(&:to_i)
  end
  
end

if $AS_MAIN
  dictionary = File.readlines("dictionary.txt").map{|e| e.chomp}
  player = ComputerPlayer.new(dictionary)
  referee = HumanPlayer.new(dictionary)
  game = Hangman.new(guesser: player, referee: referee)
  game.setup
  game.play
end