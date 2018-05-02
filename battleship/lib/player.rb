class HumanPlayer
  def initialize(name)
    @name = name
  end

  def get_play()
    puts "enter a move of the form x, y"
    gets.chomp.split(",").map(&:to_i)
  end
  


end
