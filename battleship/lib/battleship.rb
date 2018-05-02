require "./board"
require "./player"
class BattleshipGame
  attr_reader :board, :player
  def initialize(player, board)
    @board = board
    @player = player
  end

  def attack(pos)
    @board[pos] = :x
  end

  def count
    @board.count
  end

  def game_over?
    @board.won?
  end

  def play_turn
    self.attack(@player.get_play)
  end

  def play
    until game_over?
      self.play_turn
      @board.render
    end
  end


end

if $PROGRAM_NAME == __FILE__
  board = Board.new
  5.times { board.place_random_ship }
  board.reveal_ships
  game = BattleshipGame.new(HumanPlayer.new("player"), board)
  game.play
end
