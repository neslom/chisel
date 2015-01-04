gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './chisel'

class ChiselTest < MiniTest::Test
  attr_reader :parser, :document, :lines
	def setup
		@parser = Chisel.new
    @document = '# My Life in Desserts

## Chapter 1: The Beginning

"You just *have* to try the cheesecake," he said. "Ever since it appeared in
**Food & Wine** this place has been packed every night."'
	end

  def test_class_exists
  	assert parser
  end

  def test_splits_document_into_seperate_lines
    output = parser.split_lines(document)
    assert_equal ["# My Life in Desserts",
 "## Chapter 1: The Beginning",
 "\"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in\n**Food & Wine** this place has been packed every night.\""],
    output

  end

  def test_assigns_tags_according_to_hash_count
    parser.split_lines(document)
    output = ["<h1>My Life in Desserts</h1>\n\n", "<h2>Chapter 1: The Beginning</h2>\n\n", "<p>\n  \"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in\n**Food & Wine** this place has been packed every night.\"\n</p>"]
    assert_equal output, parser.hasher
  end

  def test_it_replaces_single_asterisk_with_tag
    skip
    parser.split_lines(document)
  end

end