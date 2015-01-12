require 'minitest/autorun'
require 'minitest/pride'
require_relative 'header'

class HeaderTest < MiniTest::Test
  attr_reader :header
  def setup
    @header = Header.new
  end
  def test_it_exists
    assert header
  end

  def test_hash_counter
    assert_equal 2, header.count_hashtags("## Hello there ")
  end

  def test_whitespace_deletion
    result = header.delete_whitespace_after_hashes("## Hello there ")
    assert_equal "##Hello there ", result
  end

  def test_replace_header1_tag
    output = "<h1>Hello there</h1>"
    assert_equal output, header.replace_header_tag("# Hello there ")

  end

  def test_replace_last_header2_tag
  	output = "<h2>Hello there</h2>"
  	assert_equal output, header.replace_header_tag("## Hello there ")
  end

  def test_replace_header3_tag
	  output = "<h3>Hello there</h3>"
  	assert_equal output, header.replace_header_tag("### Hello there ")
  end

  def test_replace_header4_tag
  	output = "<h4>Hello there</h4>"
  	assert_equal output, header.replace_header_tag("#### Hello there ")
  end

  def test_replace_header5_tag
  	output = "<h5>Hello</h5>"
  	assert_equal output, header.replace_header_tag("##### Hello ")
  end

end
