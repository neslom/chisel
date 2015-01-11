require 'minitest/autorun'
require 'minitest/pride'
require_relative 'header'

class HeaderTest < MiniTest::Test
  def test_it_exists
    header = Header.new("hello")
    assert header
  end

  def test_hash_counter
    header = Header.new("## Hello there ")
    assert_equal 2, header.count_hashtags
  end

  def test_whitespace_deletion
    header = Header.new("## Hello there ")
    result = header.delete_whitespace_after_hashes
    assert_equal "##Hello there ", result
  end

  def test_replace_header1_tag
    header = Header.new("# Hello there ")
    output = "<h1>Hello there</h1>"
    assert_equal output, header.replace_header_tag
  end

  def test_replace_last_header2_tag
  	header = Header.new("## Hello there ")
  	output = "<h2>Hello there</h2>"
  	assert_equal output, header.replace_header_tag
  end

  def test_replace_header3_tag
  	header = Header.new("### Hello there ")
  	output = "<h3>Hello there</h3>"
  	assert_equal output, header.replace_header_tag
  end

  def test_replace_header4_tag
  	header = Header.new("#### Hello there ")
  	output = "<h4>Hello there</h4>"
  	assert_equal output, header.replace_header_tag
  end

  def test_replace_header5_tag
  	header = Header.new("##### Hello ")
  	output = "<h5>Hello</h5>"
  	assert_equal output, header.replace_header_tag
  end

end
