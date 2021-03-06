require 'byebug'

# EASY

# Define a method that returns the sum of all the elements in its argument (an
# array of numbers).
def array_sum(arr)
  arr.reduce(0, :+)
end

# Define a method that returns a boolean indicating whether substring is a
# substring of each string in the long_strings array.
# Hint: you may want a sub_tring? helper method
def in_all_strings?(long_strings, substring)
  long_strings.all? { |l_str| l_str.include?(substring) }
end

# Define a method that accepts a string of lower case words (no punctuation) and
# returns an array of letters that occur more than once, sorted alphabetically.
def non_unique_letters(string)
  ('a'..'z').to_a.select { |c| string.count(c) > 1 }
end

# Define a method that returns an array of the longest two words (in order) in
# the method's argument. Ignore punctuation!
def longest_two_words(string)
  string.split.sort_by(&:length).reverse.take(2)
end

# MEDIUM

# Define a method that takes a string of lower-case letters and returns an array
# of all the letters that do not occur in the method's argument.
def missing_letters(string)
  ('a'..'z').to_a.reject { |c| string.include?(c) }
end

# Define a method that accepts two years and returns an array of the years
# within that range (inclusive) that have no repeated digits. Hint: helper
# method?
def no_repeat_years(first_yr, last_yr)
  (first_yr..last_yr).to_a.select { |yr| not_repeat_year?(yr) }
end

def not_repeat_year?(year)
  year.to_s.chars == year.to_s.chars.uniq
end

# HARD

# Define a method that, given an array of songs at the top of the charts,
# returns the songs that only stayed on the chart for a week at a time. Each
# element corresponds to a song at the top of the charts for one particular
# week. Songs CAN reappear on the chart, but if they don't appear in consecutive
# weeks, they're "one-week wonders." Suggested strategy: find the songs that
# appear multiple times in a row and remove them. You may wish to write a helper
# method no_repeats?
def one_week_wonders(songs)
  ret = songs.select { |song| no_repeats?(song, songs) }
  ret.uniq
end

def no_repeats?(song_name, songs)
  songs.reduce(false) do |last_was_song, song|
    if song == song_name
      if last_was_song
        return false #last week song was top so can return false
      else
        true #song was top this week so set the bool for next week
      end
    else
      false #song wasnt top this week
    end
  end
  true
end

# Define a method that, given a string of words, returns the word that has the
# letter "c" closest to the end of it. If there's a tie, return the earlier
# word. Ignore punctuation. If there's no "c", return an empty string. You may
# wish to write the helper methods c_distance and remove_punctuation.

def for_cs_sake(string)
  string = string.gsub(/[^a-z ]/i, '')
  return "" unless string.include?('c')
  string.split.reduce do |least_d_w, w|
    if c_distance(least_d_w) > c_distance(w)
      w
    else
      least_d_w
    end
  end
end

def c_distance(word)
  word.chars.reverse.reduce(0) do |dist, c|
    if c == 'c'
      return dist
    else
      dist + 1
    end
  end
end

# Define a method that, given an array of numbers, returns a nested array of
# two-element arrays that each contain the start and end indices of whenever a
# number appears multiple times in a row. repeated_number_ranges([1, 1, 2]) =>
# [[0, 1]] repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]
#[1, 2, 3, 3, 4, 4, 4, 3, 3]
def repeated_number_ranges(arr)
  start_i = nil
  res = []
  arr.each_with_index do |n, i|
    if n == arr[i+1]
      if !start_i
        start_i = i
      end
    elsif start_i
      res << [start_i, i]
      start_i = nil
    end

  end
  res
end
