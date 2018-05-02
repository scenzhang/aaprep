class Temperature
  # TODO: your code goes here!
  def self.ftoc(f)
    (f - 32) * 5.0 / 9
  end
  
  def self.ctof(c)
    c * 9.0 / 5 + 32
  end
  
  def initialize(opts)
    if opts.key?(:c)
      @temp = opts[:c]
    end
    
    if opts.key?(:f)
      @temp = Temperature.ftoc(opts[:f])
    end

  end
  
  def self.from_celsius(c)
    return Temperature.new({:c=>c})
  end
  
  def self.from_fahrenheit(f)
    return Temperature.new({:f=>f})
  end
  
  def in_celsius
    @temp
  end
  
  def in_fahrenheit
   Temperature.ctof(@temp)
  end
  
end

class Celsius < Temperature
  def initialize(c)
    @temp = c
  end
  
end

class Fahrenheit < Temperature
  def initialize(f)
    @temp = Temperature.ftoc(f)
  end
  
end
