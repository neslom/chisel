require 'minitest/autorun'
require 'minitest/pride'
require './lib/paragraph'

class ParagraphTest < MiniTest::Test
  attr_reader :para
  def setup
    @para = Paragraph.new
  end
  def test_it_exists
    assert Paragraph.new
  end

  def test_it_adds_tags_to_single_line_chunk
    result = "<p>\n  You just *have* to try the cheesecake,\n</p>"
    assert_equal result, para.paragraph_tagger("You just *have* to try the cheesecake,")
  end

  def test_it_adds_tags_to_multiple_line_chunk
    result = "<p>\n  You just *have* to try the cheesecake,\n  it's so damn yummy.\n</p>"                        
    assert_equal result, para.paragraph_tagger("You just *have* to try the cheesecake,\nit's so damn yummy.")
  end

  def test_spaces_after_line_break
    result = "Hey just checking\n  to see if this works."
    assert_equal result, para.space_after_line_break("Hey just checking\nto see if this works.")
  end
end
