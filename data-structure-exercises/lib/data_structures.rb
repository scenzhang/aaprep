# EASY

# Write a method that returns the range of its argument (an array of integers).
def range(arr)
  # your code goes here
  arr.sort[-1] - arr.sort[0]
end

# Write a method that returns a boolean indicating whether an array is in sorted
# order. Use the equality operator (==), which returns a boolean indicating
# whether its operands are equal, e.g., 2 == 2 => true, ["cat", "dog"] ==
# ["dog", "cat"] => false
def in_order?(arr)
  arr == arr.sort
  # your code goes here
end


# MEDIUM

# Write a method that returns the number of vowels in its argument
def num_vowels(str)
  str.count('aeiouAEIOU')

  # your code goes here
end

# Write a method that returns its argument with all its vowels removed.
def devowel(str)
  str.delete('aeiouAEIOU')
  # your code goes here
end


# HARD

# Write a method that returns the returns an array of the digits of a
# non-negative integer in descending order and as strings, e.g.,
# descending_digits(4291) #=> ["9", "4", "2", "1"]
def descending_digits(int)
  # your code goes here
  int.to_s.chars.to_a.sort.reverse
end

# Write a method that returns a boolean indicating whether a string has
# repeating letters. Capital letters count as repeats of lowercase ones, e.g.,
# repeating_letters?("Aa") => true
def repeating_letters?(str)
  s_arr = str.downcase.chars.to_a
  s_arr.uniq != s_arr
  # your code goes here
end

# Write a method that converts an array of ten integers into a phone number in
# the format "(123) 456-7890".
def to_phone_number(arr)
  # your code goes here
  ac = arr[0..2].join
  predash = arr[3..5].join
  postdash = arr[6..9].join
  "(#{ac}) #{predash}-#{postdash}"
end

# Write a method that returns the range of a string of comma-separated integers,
# e.g., str_range("4,1,8") #=> 7
def str_range(str)
  int_arr = str.split(',').map(&:to_i)
  int_arr.sort[-1] - int_arr.sort[0]
  # your code goes here
end


#EXPERT

# Write a method that is functionally equivalent to the rotate(offset) method of
# arrays. offset=1 ensures that the value of offset is 1 if no argument is
# provided. HINT: use the take(num) and drop(num) methods. You won't need much
# code, but the solution is tricky!
def my_rotate(arr, offset=1)
  # your code goes here
  offset = arr.length + offset if offset < 0
  offset = offset % arr.length if offset > arr.length
  arr.drop(offset) + arr.take(offset)
end
