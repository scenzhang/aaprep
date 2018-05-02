class ComputerPlayer
  attr_reader :name, :board
  attr_accessor :mark
  
  def initialize(name)
    @name = name
    @board = nil
    
  end

  def display(board)
    @board = board
  end


  def get_move
    #winning rows
    (0..2).each do |row|
      pos0 = [row, 0]
      pos1 = [row, 1]
      pos2 = [row, 2]
      if @board[pos0] && @board[pos0] == @board[pos1] && !@board[pos2]
        return pos2
      elsif @board[pos1] && @board[pos1] == @board[pos2] && !@board[pos0]
        return pos0
      elsif @board[pos0] && @board[pos0] == @board[pos2] && !@board[pos1]
        return pos1
      end
    end
    #winning cols
    (0..2).each do |col|
      pos0 = [0, col]
      pos1 = [1, col]
      pos2 = [2, col]
      if @board[pos0] && @board[pos0] == @board[pos1] && !@board[pos2]
        return pos2
      elsif @board[pos1] && @board[pos1] == @board[pos2] && !@board[pos0]
        return pos0
      elsif @board[pos0] && @board[pos0] == @board[pos2] && !@board[pos1]
        return pos1
      end
    end
    # diagonals
    pos0 = [0, 0]
    pos1 = [1, 1]
    pos2 = [2, 2]
    if @board[pos0] && @board[pos0] == @board[pos1] && !@board[pos2]
      return pos2
    elsif @board[pos0] && @board[pos0] == @board[pos2] && !@board[pos1]
      return pos1
    elsif @board[pos1] && @board[pos1] == @board[pos2] && !@board[pos0]
      return pos0
    end
    pos0 == [0, 2]
    pos2 == [2, 0] 
    if @board[pos0] && @board[pos0] == @board[pos1] && !@board[pos2]
      return pos2
    elsif @board[pos0] && @board[pos0] == @board[pos2] && !@board[pos1]
      return pos1
    elsif @board[pos1] && @board[pos1] == @board[pos2] && !@board[pos0]
      return pos0
    end

    empty_spots = []
    (0..2).each do |row|
      (0..2).each do |col|
        pos = [row, col]
        if !@board[pos]
          empty_spots << pos
        end
      end
    end
    empty_spots.shuffle[0]
    end
end
