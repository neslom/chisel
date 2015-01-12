require 'minitest/autorun'
require 'minitest/pride'
require './lib/emphasis'

class EmphasisTest < MiniTest::Test
  attr_reader :text, :asterisk
  def setup
    @asterisk = Emphasis.new
    @text = '"You just *have* to try the cheesecake," he said. "Ever since it appeared in
**Food & Wine** this place has been packed every night."'
  end

  def test_it_exists
    assert Emphasis.new
  end

  def test_it_scans_text_for_asterisk_words
    assert_equal ["*have*", "**Food & Wine**"], asterisk.scanner(text)
  end
  
  def test_asterisk_counter
    two = "*have*"
    four = "**Food & Wine**"
    assert_equal 2, asterisk.asterisk_counter(two)
    assert_equal 4, asterisk.asterisk_counter(four)
  end

  def test_it_replaces_two_asterisks
    two_asterisk_word = "*have*"
    assert_equal "<em>have</em>", asterisk.asterisk_two_sub(two_asterisk_word)
  end

  def test_it_replaces_four_asterisks
    four_asterisk_word = "**Food & Wine**"
    assert_equal "<strong>Food & Wine</strong>", asterisk.asterisk_four_sub(four_asterisk_word)
  end

  def test_zip_words
    result = [["*have*", "<em>have</em>"], ["**Food & Wine**", "<strong>Food & Wine</strong>"]]
    assert_equal result, asterisk.zip_words(text)
  end

  def test_replaces_words
    result = "\"You just <em>have</em> to try the cheesecake,\" he said. \"Ever since it appeared in\n<strong>Food &amp; Wine</strong> this place has been packed every night.\""
    assert_equal result, asterisk.replace_words(text)
  end
end
