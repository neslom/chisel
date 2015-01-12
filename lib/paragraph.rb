class Paragraph
  def paragraph_tagger(text)
   "<p>\n" + "  " + space_after_line_break(text) + "\n</p>" 
  end
  
  def space_after_line_break(text)
    text.gsub("\n","\n  ")
  end

end
