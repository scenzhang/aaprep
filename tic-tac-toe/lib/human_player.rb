class HumanPlayer
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def get_move
    puts "where"
    move = gets.chomp
    move.split(',').map!(&:to_i)
  end

  def display(board)
    board.grid.each do |a|
      puts a.join(" ")
    end
  end

end
