class Fixnum
  def in_words
    return "zero" if self == 0
    #creates a 'stack' of unit values for each magnitude
    magnitudes = ["", "thousand", "million", "billion", "trillion"]
    units = self.to_s.reverse.split(//).join.scan(/.{1,3}/).map(&:reverse).map(&:to_i)
    
    #apply word format and join with magnitude indicator for each unit
    word = (0..5).map do |i|
      "#{words_sub_1000(units[i])} #{magnitudes[i]}" unless
        (units[i].nil? || units[i] == 0 || magnitudes[i].nil?)
    end
    
    #clean up and deliver the results
    word.reverse.join(" ").strip.chomp.gsub(/[ ]+/, ' ')
  end
  
  private 
  def words_sub_1000 number

    hundreds = number / 100
    rest = number % 100
    
    hundreds = hundreds == 0 ? "" : "#{to_19(hundreds)} hundred "
    
    if rest < 20
      rest = to_19(rest)
    else
      rest = "#{tens(rest/10)} #{to_19(rest%10)}"
    end
 
    hundreds + rest
  end
  
  def to_19 number
    to_19 = %W{ #{ } one two three four five
            six seven eight nine ten
            eleven twelve thirteen fourteen
            fifteen sixteen seventeen eighteen nineteen}
            
    to_19[number]
  end
  
  def tens number
    tens = %W{#{ } #{ } twenty thirty forty 
              fifty sixty seventy eighty ninety}
    tens[number]
  end
  
    
end
