def translate phrase
  phrase.split(' ').map do |word|
    # checks capitalization format & downcases
    capitalize = true if word == word.capitalize
    allcaps = true if word == word.upcase
    word.downcase!
  
    # set aside trailing punctuation
    punctuation = word.slice!(/\W+$/)
    
    # run pig_latin helper
    word = pig_latin(word)
    
    # restore capitalization
    word.capitalize! if capitalize
    word.upcase! if allcaps
    
    # restore punctuation
    punctuation ? word+punctuation : word
  end.join(' ')
end

# helper that translates individual words
def pig_latin word
  vowel = word =~ /[aeio]|(?<!q)u/
  word[vowel..-1]+word[0...vowel]+'ay'
end
