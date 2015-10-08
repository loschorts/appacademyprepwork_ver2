require 'byebug'

class Code
  attr_reader :pegs
  PEGS = Hash.new

  def initialize code_array
    @pegs = code_array
  end
  
  def self.parse code
    code.downcase!
    if /[rgbyop]{4}/ =~ code
      self.new code.split(//)
    else
      raise 'invalid characters'
    end
  end
  
  def self.random
    peg_array = %w[r g b y o p]
    code = 4.times.map{peg_array.sample}
    self.new code
  end
  
  def [] index
    @pegs[index]
  end
  
  def exact_matches other
    matches = 0 
    @pegs.length.times do |i|
      matches += 1 if self[i] == other[i]
    end
    matches
  end
  
  def near_matches other
    a1 = @pegs.dup
    a2 = other.pegs.dup
    @pegs.length.times do |index|
      a1[index], a2[index] = :delete, :delete if a1[index] == a2[index]
    end
    
    matches = 0
    @pegs.length.times do |index|
      next if a1[index] == :delete
      matched_at = a2.find_index(a1[index])
      if matched_at
        matches +=1
        a2[matched_at] = :delete
      end
    end
    matches
    
  end
  
  def == other
    return false unless other.class == Code
    self.exact_matches(other) == 4 ? true : false
  end
    

end

class Game
  attr_reader :secret_code
  def initialize code = nil
    @secret_code = code.nil? ? Code.random : code
  end
  
  def get_guess
    print 'enter guess as string: '
    @guess = Code.parse(gets.chomp)
  end
  
  def display_matches code
    puts "exact matches: #{@secret_code.exact_matches(code)}"
    puts "near matches: #{@secret_code.near_matches(code)}"
  end
  
  def game_won?
    @secret_code.exact_matches(@guess) == 4
  end
  
  def play
    turns = 10
    while turns > 0
      p @secret_code.pegs
      puts "turns left: #{turns}"
      turns -= 1
      get_guess
      display_matches @guess
      
      if game_won?
        puts 'you won'
        break
      end
      
    end
    
    puts 'game over'
    p @secret_code.pegs
    
  end
end

if __FILE__ == $0
  Game.new(Code.parse('bbbr')).play
end