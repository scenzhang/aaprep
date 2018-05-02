require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_reader :board, :current_player
  def initialize(player1, player2)
    player1.mark = :X
    player2.mark = :O
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @board = Board.new
  end

  def switch_players!
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def play_turn
    @current_player.display(@board)
    @board.place_mark(@current_player.get_move, @current_player.mark)
    self.switch_players!
  end

  def play
    until @board.over?
      self.play_turn
    end
  end

  if $PROGRAM_NAME == __FILE__
    player1 = HumanPlayer.new("nerd")
    player2 = ComputerPlayer.new("MrDestructoid")
    g = Game.new(player1, player2)
    g.play

  end


end
