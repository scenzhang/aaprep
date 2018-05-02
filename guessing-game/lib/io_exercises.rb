# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.



def guessing_game
  n = Random.rand(1..99)
  num_guesses = 0
  loop do
    num_guesses += 1
    puts 'guess a number'
    guess = gets.chomp.to_i
    break if guess == n
    puts guess
    puts 'too high' if guess > n
    puts 'too low' if guess < n
  end
  puts "the number was #{n}"
  puts "it took #{num_guesses} guesses"
end

