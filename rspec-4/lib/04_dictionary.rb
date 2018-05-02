class Dictionary

  attr_reader :entries
  def initialize
    @entries = {}
  end

  def add(definition)
    if definition.class == Hash
      definition.each do |k, v|
        @entries[k] = v
      end
    else
      @entries[definition] = nil
    end
  end

  def keywords
    @entries.keys.sort
  end
  
  def include?(word)
    @entries.key?(word)
  end

  def find(str)
    res = {}
    @entries.each do |k, v|
      if k.index(str) == 0
        res[k] = v
      end
    end
    res
  end
  
  def printable
    str = ""
    @entries.sort.each do |k, v|
       str += "\[#{k}\] \"#{v}\"\n"
    end
    str[0...-1] #remove last newline
    
  end
  
    
  


  
    # TODO: your code goes here!
end
