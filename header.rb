class Header
  def count_hashtags(text)
    text.count("#")
  end 

  def delete_whitespace_after_hashes(text)
    text[count_hashtags(text)] = ""
    text
  end

  def hashtag_regenerator(text)
    "#" * count_hashtags(text)
  end

  def text_splitter(text)
     text.split.join(" ")
  end

  def replace_header_tag(text)
    delete_whitespace_after_hashes(text)
    text_splitter(text).gsub("#{hashtag_regenerator(text)}", "<h#{count_hashtags(text)}>") + "</h#{count_hashtags(text)}>"
  end

end
