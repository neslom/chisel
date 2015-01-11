require 'minitest/autorun'
require 'minitest/pride'
require_relative 'paragraph'

class ParagraphTest < MiniTest::Test
  def test_it_exists
    assert Paragraph.new("Hello")
  end

  def test_it_adds_tags_to_single_line_chunk
    para = Paragraph.new("You just *have* to try the cheesecake,")
    result = "<p>\n  You just *have* to try the cheesecake,\n</p>"
    assert_equal result, para.paragraph_tagger
  end

  def test_it_adds_tags_to_multiple_line_chunk
    para = Paragraph.new("You just *have* to try the cheesecake,\nit's so damn yummy.")
    result = "<p>\n  You just *have* to try the cheesecake,\n  it's so damn yummy.\n</p>"                        
    assert_equal result, para.paragraph_tagger
  end

  def test_spaces_after_line_break
    para = Paragraph.new("Hey just checking\nto see if this works.")
    result = "Hey just checking\n  to see if this works."
    assert_equal result, para.space_after_line_break
  end
end
