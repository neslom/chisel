require 'pry'
class Header
  attr_reader :text
  def initialize(text)
    @text = text
  end

  def count_hashtags
    text.count("#")
  end 

  def delete_whitespace_after_hashes
    text[count_hashtags] = ""
    text
  end

  def hashtag_regenerator
    "#" * count_hashtags
  end

  def text_splitter
     text.split.join(" ")
  end

  def replace_header_tag
    delete_whitespace_after_hashes 
    text_splitter.gsub("#{hashtag_regenerator}", "<h#{count_hashtags}>") + "</h#{count_hashtags}>"
  end

end
