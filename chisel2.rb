require './header'
require './paragraph'
require './emphasis'

class Chisel
  attr_reader :document, :header, :paragraph, :emphasis
  def initialize(document)
    @document = document
    @header = Header.new
    @paragraph = Paragraph.new
    @emphasis = Emphasis.new
  end

  def split_doc_into_lines
   document.split("\n\n") 
  end

  def has_hash?(line)
    line.include?("#")  
  end

  def has_paragraph?(line)
    true if line[0] != "#"
  end 

  def line_checker
    split_doc_into_lines.map do |line|
      if has_hash?(line)
        header.replace_header_tag(line)
      elsif has_paragraph?(line)
        paragraph.paragraph_tagger(line)
      end
    end
  end

  def parse
    emphasis.replace_words(line_checker.join("\n\n"))
  end
end










document = '# My Life in Desserts

## Chapter 1: The Beginning

 "You just *have* to try the cheesecake," he said. "Ever since it appeared in
 **Food & Wine** this place has been packed every night."'

 parser = Chisel.new(document)
 output = parser.parse
 puts output

