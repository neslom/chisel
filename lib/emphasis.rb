class Emphasis
  def split_words(text)
    text.split 
  end

  def scanner(text)
    text.scan(/\*.+\*/)
  end

  def asterisk_counter(word)
   word.count("*") 
  end

  def emphasis(text)
    scanner(text).map do |word|
      if asterisk_counter(word) == 4
        asterisk_four_sub(word)
      elsif asterisk_counter(word) == 2
       asterisk_two_sub(word) 
      end
    end
  end

  def zip_words(text)
    scanner(text).zip(emphasis(text))
  end

  def replace_words(text)
    first_em = zip_words(text)[0]
    second_em = zip_words(text)[1]
    text.sub(first_em[0], first_em[1]).sub(second_em[0], second_em[1]).sub("&", "&amp;")
  end 

  def asterisk_two_sub(word)
    word.sub("*", "<em>").chop + "</em>"
  end

  def asterisk_four_sub(word)
    word.sub("**", "<strong>").chop.chop + "</strong>"
  end
end
