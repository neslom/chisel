require 'minitest/autorun'
require 'minitest/pride'
require_relative 'paragraph'

class ParagraphTest < MiniTest::Test
  def test_it_exists
    assert Paragraph.new
  end
end
