def echo(str)
  str
end

def shout(str)
  str.upcase
end

def repeat(str, times=2)
  ([str] * times).join(" ")
end

def start_of_word(word, n)
  word.chars.take(n).join
end

def first_word(str)
  str.split(' ').first
end

def titleize(str)
  little_words = %w(and or the a for over)
  s_arr = str.split(" ")
  s_arr[0].capitalize!
  s_arr.each do |word|
    unless little_words.include?(word)
      word.capitalize!
    end
  end
  s_arr.join(" ")
end
