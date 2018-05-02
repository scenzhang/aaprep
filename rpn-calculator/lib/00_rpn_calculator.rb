class RPNCalculator
  # TODO: your code goes here!
  def initialize
    @stack = []
  end

  def value
    @stack[-1]
  end
  

  def push(val)
    @stack << val
  end
  
  def plus
    empty_raiser()
    @stack << (@stack.pop + @stack.pop)
    
  end

  def minus
    empty_raiser()    
    a = @stack.pop
    b = @stack.pop
    @stack <<  b - a
  end
  
  def times
    empty_raiser()    
    @stack << @stack.pop * @stack.pop
  end
  
  def divide
    empty_raiser()    
    a = @stack.pop
    b = @stack.pop
    @stack << Float(b) / a
  end

  def tokens(str)
    ops = {
      '+'=>:+,
      '-'=>:-,
      '*'=>:*,
      '/'=>:/ 
    }
    str.split(" ").map do |c|
      ops.key?(c) ? ops[c] : c.to_i
    end
  end

  def evaluate(str)
    ops = {
      :+ => :plus,
      :- => :minus,
      :* => :times,
      :/ => :divide
    }
    tokens_a = tokens(str)
    tokens_a.each do |t|
      if ops.key?(t)
        self.send(ops[t])
      else
        self.push(t)
      end
    end
    @stack[-1]
  end
    
  
  private
  
  def empty_raiser
      raise 'calculator is empty' if @stack.empty?
  end

  
      
    
  

  
end
