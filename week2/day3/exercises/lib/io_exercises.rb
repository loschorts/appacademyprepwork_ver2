# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game
  number = rand(100) + 1
  guess = nil
  guesses = 0
  while guess != number
    print 'guess a number: '
    guess = gets.chomp.to_i
    guesses +=1
    puts "#{guess} was too high" if guess > number
    puts "#{guess} was too low" if guess < number
  end
  puts "#{guess} was correct! you took #{guesses} guesses."
end

