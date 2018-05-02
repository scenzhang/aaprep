# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  str.delete!(('a'..'z').to_a.join)
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  l = str.length
  if l.odd?
    str[l/2]
  else
    str[l/2-1..l/2]
  end

end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
  ctr = 0
  str.downcase.chars.each do |c|
    ctr += 1 if VOWELS.include?(c)
  end
  ctr

end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  (1..num).inject(:*)
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
  acc = ""
  arr.each_with_index do |s, i|
    acc += s
    acc += separator unless i == arr.length-1
  end
  acc

end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  str.chars.each_with_index do |c, i|
    if i.even?
      str[i] = c.downcase
    else
      str[i] = c.upcase
    end
  end
  str
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
  arr = str.split(" ")
  arr.each do |w|
    w.reverse! if w.length >= 5
  end
  arr.join(" ")

end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
  arr = (1..n).to_a
  arr.each_with_index do |i, idx|
    if i%15 == 0
      arr[idx] = "fizzbuzz"
    elsif i%5 == 0
      arr[idx] = "buzz"
    elsif i%3 == 0
      arr[idx] = "fizz"
    end
  end
  arr

end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  newarr = []
  (arr.length-1).downto(0) {|i| newarr << arr[i] }
  newarr

end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
  return FALSE if num == 1
  (2..Math.sqrt(num).round).each { |div| return FALSE if num % div == 0 }
  TRUE

end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  fac = []
  (1..num).each do |n|
    fac << n if num % n == 0
  end
  fac
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  facs = factors(num)
  facs.find_all { |n| prime?(n) }
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  evens = arr.reject(&:odd?)
  odds = arr.reject(&:even?)
  return evens[0] if evens.length == 1
  return odds[0] if odds.length == 1

end
