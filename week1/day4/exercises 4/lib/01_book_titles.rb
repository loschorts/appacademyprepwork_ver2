class Book
	attr_accessor :title
  def title=(string)
    minor_words = %w{the a an and in of}
    @title = string.capitalize.split(" ").map { |word|
      minor_words.include?(word) ? word.downcase : word.capitalize
      }.join(" ")
  end
end
