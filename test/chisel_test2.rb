require 'minitest/autorun'
require 'minitest/pride'
require './lib/chisel2'

class ChiselTest < MiniTest::Test
  attr_reader :parser
  def setup
    @parser = Chisel.new("# My Life in Desserts\n\n## Chapter 1: The Beginning\n\n\"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in\n**Food & Wine** this place has been packed every night.\"") 
  end

  def test_it_exists
    assert parser 
  end

  def test_it_splits_document_into_lines
    result = ["# My Life in Desserts", "## Chapter 1: The Beginning", "\"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in\n**Food & Wine** this place has been packed every night.\""]
    assert_equal result, parser.split_doc_into_lines
  end

  def test_line_for_hashtag
    line = "# My Life in Desserts"
    assert parser.has_hash?(line)
  end

  def test_line_for_paragraph 
    line = "\"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in\n**Food & Wine** this place has been packed every night.\""
    assert parser.has_paragraph?(line)
  end

  def test_places_headings_per_line
    result = ["<h1>My Life in Desserts</h1>",
 "<h2>Chapter 1: The Beginning</h2>",
 "<p>\n  \"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in\n  **Food & Wine** this place has been packed every night.\"\n</p>"]
    assert_equal result, parser.line_checker     
  end

  def test_final_printout
    result = "<h1>My Life in Desserts</h1>\n\n<h2>Chapter 1: The Beginning</h2>\n\n<p>\n  \"You just <em>have</em> to try the cheesecake,\" he said. \"Ever since it appeared in\n  <strong>Food &amp; Wine</strong> this place has been packed every night.\"\n</p>"    
    assert_equal result, parser.parse
  end
end
