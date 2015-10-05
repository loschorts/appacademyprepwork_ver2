class XmlDocument
  def initialize indent = false
    @indent = indent
    @tab_level = 0
  end
  
  def method_missing(method_name, args={})
    if @indent
      @tab_level += 1
      nl = "\n"
    else
      nl = ""
    end
    
    tab = ("  " * @tab_level)[0..-3]
    
    if args.empty? 
      xml_class =  "" 
    else
      xml_class = " #{args.keys[0]}=\"#{args[args.keys[0]]}\""
    end
  	
    tag = "#{method_name}#{xml_class}"
    
    if block_given?
      tab + "<#{tag}>#{nl}#{yield}#{tab}</#{tag}>" + nl
    else
      tab + "<#{tag}/>" + nl
    end
  end
  
end