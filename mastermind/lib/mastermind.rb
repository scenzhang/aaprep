class Code
  attr_reader :pegs
  PEGS = {
    'r' => :red,
    'b' => :blue,
    'y' => :yellow,
    'g' => :green,
    'o' => :orange,
    'p' => :purple
  }
  def self.parse(code_str)
    
    if code_str.length != 4 
      raise ArgumentError.new('length of code must be 4')
    elsif code_str.downcase.chars.any? { |c| !PEGS.key?(c) }
      raise ArgumentError.new('invalid color')
    end
    Code.new(code_str.downcase.chars)#.map { |c| PEGS[c] })

  end

  def initialize(pegs_arr)
    @pegs = pegs_arr
  end

  def self.random
    pegs = PEGS.keys.sample(4)
    Code.new(pegs)
  end

  def [](idx)
    @pegs[idx]
  end

  def exact_matches(other)
    if other.class != Code
      return 0
    end
    @pegs.each_index.reduce(0) do |sum, i|
      if @pegs[i] == other[i]
        sum + 1
      else
        sum
      end
    end
  end

  def ==(other)
    self.exact_matches(other) == 4
  end

  def near_matches(other)
    self_freq = Hash[@pegs.map { |c| [c, @pegs.count(c)] }]
    other_freq = Hash[other.pegs.map { |c| [c, other.pegs.count(c)] }]
    matches = 0
    self_freq.each
    self_freq.each do |col, ct|
      next unless other_freq.key?(col)
      matches += [ct, other_freq[col]].min
    end
    matches - self.exact_matches(other)

  end
    


end

class Game
  attr_reader :secret_code

  def initialize(code = Code.random, max_turns = 10)
    @secret_code = code
    @turns = 0
    @max = max_turns
  end

  def get_guess
    puts "enter your guess"
    Code.parse(gets.chomp)
    # gets.chomp
  end

  def display_matches(other_code)
    puts "exact matches: #{@secret_code.exact_matches(other_code)}"
    puts "near matches: #{@secret_code.near_matches(other_code)}"
  end

  def play
    # puts @secret_code.pegs
    while @turns < @max
      guess = get_guess
      display_matches(guess)
      if @secret_code.exact_matches(guess) == 4
        puts "you win!"
        return
      end
      @turns += 1
      puts "you have #{@max - @turns} turns left"
    end
    puts "lol noob it was #{@secret_code.pegs.join('')}"
  end


end

if $PROGRAM_NAME == __FILE__
  game = Game.new()
  game.play
end
