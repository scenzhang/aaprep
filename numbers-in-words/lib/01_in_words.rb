class Fixnum
  def in_words
    if self == 0
        return "zero"
    end
    
    words = []
    trillions = self / 1_000_000_000_000
    remaining = self % 1_000_000_000_000
    billions = remaining / 1_000_000_000
    remaining = remaining % 1_000_000_000
    millions = remaining / 1_000_000
    remaining = remaining % 1_000_000
    thousands = remaining / 1_000
    remaining = remaining % 1_000
    unless trillions == 0
        words << small_in_words(trillions)
        words << "trillion"
    end
    unless billions == 0
        words << small_in_words(billions)
        words << "billion"
    end
    unless millions == 0
        words << small_in_words(millions)
        words << "million"
    end
    unless thousands == 0
        words << small_in_words(thousands)
        words << "thousand"
    end
    unless remaining == 0
        words << small_in_words(remaining)
    end
    
    words.join(" ")
    
end

def small_in_words(n)
    nums = %w(zero one two three four five six seven eight nine)
    tys =  %w(twenty thirty forty fifty sixty seventy eighty ninety)
    hundreds = n / 100
    n = n % 100
    wordnum = []
    unless hundreds == 0
        wordnum << nums[hundreds] + " hundred"
    end

    if n >= 20
        tens = n / 10
        wordnum << tys[tens - 2] unless tens == 0
        remaining = n % 10
        wordnum << nums[remaining] unless remaining == 0
    end
    
    
    if n == 10
        wordnum << "ten"
    elsif n == 11
        wordnum <<"eleven"
    elsif n == 12
        wordnum << "twelve"
    elsif n == 13
        wordnum << "thirteen"
    elsif n == 15
        wordnum << "fifteen"
    elsif n == 18
        wordnum << "eighteen"
    end
    
    if [14, 16, 17, 19].include?(n)
        wordnum << nums[(n % 10)] + "teen"
    end

    if 0 < n && n < 10
        wordnum << nums[n]
    end
    
    wordnum.join(" ")
 end

end
