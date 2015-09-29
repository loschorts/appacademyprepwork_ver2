class Dictionary
  attr_reader :entries
  def initialize
    @entries = {}
  end
  
  def add entry
    if entry.class == Hash
      @entries.merge!(entry)
    else
      @entries.merge!(entry => nil)
    end
  end
  
  def keywords
    @entries.keys.sort
  end
  
  def include? word
    keywords.include?(word)
  end
  
  def find prefix
    @entries.select {|k, v| k.start_with? prefix}
  end
  
  def printable
    @entries.map do |k, v|
      "[#{k}] \"#{v}\"\n"
    end.sort.join.strip
  end
      
      

end
