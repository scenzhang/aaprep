class Board
  attr_reader :grid
  def initialize(grid=nil)
    if grid
      @grid = grid
    else
      @grid = Array.new(3) { Array.new(3) }
    end
    
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def place_mark(pos, mark)
    if empty?(pos)
      self[pos] = mark
    else 
      throw 'position already marked'
    end
  end

  def empty?(pos)
    !self[pos]
  end

  def winner
    win_mark = nil
    (0..2).each do |i|
      if !!@grid[i][0] && @grid[i][0] == @grid[i][1] && @grid[i][1] == @grid[i][2]
        win_mark = @grid[i][0]
      elsif !!@grid[0][i] && @grid[0][i] == @grid[1][i] && @grid[1][i] == @grid[2][i]
        win_mark = @grid[0][i]
      end
    end
    if !!@grid[0][0] && @grid[0][0] == @grid[1][1] && @grid[1][1] == @grid[2][2]
      win_mark = @grid[0][0]
    elsif !!@grid[0][2] && @grid[0][2] == @grid[1][1] && @grid[1][1] == @grid[2][0]
      win_mark = @grid[0][2]
    end

    win_mark
  end

  def over?
    if self.winner
      return true
    elsif @grid.all? { |a| a.all? { |e| !!e } } #check if every spot is marked
      return true
    end
    false
  end


end
