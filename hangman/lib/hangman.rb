class Hangman
  attr_reader :guesser, :referee, :board

  def initialize(opts)
    @referee = opts[:referee]
    @guesser = opts[:guesser]
  end

  def setup
    len = @referee.pick_secret_word
    @guesser.register_secret_length(len)
    @board = Array.new(len)
  end

  def take_turn
    guess = @guesser.guess(@board)
    found_is = @referee.check_guess(guess)
    @guesser.handle_response(guess, found_is)
    update_board(guess, found_is)

  end

  def update_board(letter, idxs)
    idxs.each do |i|
      @board[i] = letter
    end
  end

  def play
    setup
    while @board.any?(&:nil?) # && @turns < @max_turns
      take_turn
      @board.each do |letter|
        print letter ? letter : '_'
      end
      puts ''

    end
    
  end

end

class Player
  attr_reader :secret_length
  
  def initialize(dictionary=[])
    @dictionary = dictionary
    @guessed_letters = []
  end
  
  def check_guess(letter)
    found_idx = []
    @secret_word.chars.each_with_index do |c, i|
      found_idx << i if c == letter
    end
    found_idx
  end
  
  def register_secret_length(len)
    @secret_length = len
  end

  def guess(_board)
    ('a'..'z').to_a.sample
  end

  def handle_response(guess, idxs)
    puts "#{guess} at #{idxs}"
  end


end


class HumanPlayer < Player

  
  def pick_secret_word
    puts 'pick a word.'
    register_secret_length(gets.chomp.to_i)
  end

  def guess(board)
    puts "#{board.length} letters"
    gets.chomp
  end

  def check_guess(letter)
    puts "enter positions #{letter} occurs at"
    gets.chomp.split(",").map(&:to_i)
  end



end

class ComputerPlayer < Player

  def pick_secret_word
    @secret_word = @dictionary.sample
    @secret_word.length
  end

  def handle_response(guess, idxs)

    @candidate_words.select! do |word|
      idxs.all? { |idx| word[idx] == guess }
    end

  end

  def guess(_board)
    @candidate_words ||= @dictionary.select { |word| word.length == @secret_length }
    cand_letter_counts = {}
    ('a'..'z').to_a.each do |letter|
      cand_letter_counts[letter] = @candidate_words.join.count(letter)
    end
    cand_letter_counts = cand_letter_counts.sort_by { |_, n| -n }
    guess = ''
    cand_letter_counts.each do |letter, _|
      next if @guessed_letters.include?(letter)
      guess = letter
      @guessed_letters << letter
      break
    end
    guess

    

    # guess
  end




end



if $PROGRAM_NAME == __FILE__
  dictionary = File.readlines("dictionary.txt")
  dictionary.map!(&:chomp)
  comp = ComputerPlayer.new(dictionary)
  human = HumanPlayer.new
  human_guess_opts = { 
    referee: comp,
    guesser: human
  }
  comp_guess_opts = {
    referee: human,
    guesser: comp
  }
  # game = Hangman.new(human_guess_opts)
  puts "type 1 to guess, type 2 to let computer guess"
  mode = gets.chomp.to_i
  opt = human_guess_opts if mode == 1
  opt = comp_guess_opts if mode == 2
  
  game = Hangman.new(opt)
  game.play
end
