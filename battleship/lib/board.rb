class Board
  attr_reader :grid

  def self.default_grid
    Array.new(10) { Array.new(10) }
  end

  def initialize(grid = Board.default_grid)
    @grid = grid
  end

  def count
    @grid.flatten.count(:s)
  end

  def empty?(pos = nil)
    if pos
      !self[pos]
    else
      self.count == 0
    end

  end

  def full?
    @grid.flatten.none?(&:nil?)
  end

  def place_random_ship
    if self.full?
      raise 'board full'
    end
    loop do
      pos = [Random.rand(@grid.count), Random.rand(@grid[0].count)]
      unless self[pos]
        self[pos] = :s
        break
      end
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, elt)
    x, y = pos
    @grid[x][y] = elt
  end

  def won?
    @grid.flatten.none? { |spot| spot == :s }
  end

  def reveal_ships
    @grid.each_index do |row|
      @grid[row].each_index do |col|
        if @grid[row][col] == :s
          puts "#{row}, #{col}"
        end
      end
    end
  end

  def render
    @grid.each do |row|
      row.each do |space|
        if space == :x
          print 'x'
        else
          print '_'
        end
      end
      puts ''
    end
  end

end
