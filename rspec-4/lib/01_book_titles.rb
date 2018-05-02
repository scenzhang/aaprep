class Book
  # TODO: your code goes here!
  def title=(title)
    small_words = %w(and or the an a in of)
    title_a = title.split(" ")
    title_a.map! do |w|
      small_words.include?(w) ? w : w.capitalize 
    end
    title_a[0].capitalize!
    @title = title_a.join(" ")  
  end
  
  def title
    @title
  end
end
