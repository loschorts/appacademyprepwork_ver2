def echo phrase
  #returns phrase
  phrase
end

def shout phrase
  #returns phrase in caps
  phrase.upcase
end

def repeat phrase, numtimes = 2
  #returns phrase numtimes times (default once)
  ("#{phrase} " * numtimes).strip
end

def start_of_word word, num_letters
  #returns first num_letters letters of word
  word[0...num_letters]
end

def first_word sentence
  #returns first word of sentence
  sentence.split(" ")[0]
end

def titleize title
  #returns title with certain words capitalized
  lowercase_words = ["and", "the", "over"]
  title.capitalize.split(" ").collect do |word|
    lowercase_words.include?(word) ? word : word.capitalize
  end.join(" ")
end

