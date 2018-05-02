def translate(str)
  str.split(" ").map{ |w| translate_word(w) }.join(" ")
end

def translate_word(word)
  vowels = %w(a e i o u)
  w_arr = word.chars
  num_consonants = w_arr.reduce(0) do |n, c|
    if vowels.include?(c)
      break n
    else
      n + 1
    end
  end
  if w_arr.take(num_consonants)[-1] == 'q' && w_arr[num_consonants] == 'u'
    num_consonants += 1
  end
  w_arr << w_arr.shift(num_consonants)
  w_arr.join('') + 'ay'
# word
end
