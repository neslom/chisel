class Paragraph
  attr_reader :text
  def initialize(text)
    @text = text
  end

  def paragraph_tagger
   "<p>\n" + "  " + space_after_line_break + "\n</p>" 
  end
  
  def space_after_line_break
    text.gsub("\n","\n  ")
  end

end
