require 'minitest/autorun'
require_relative '../../lib/huffman/letter_frequency'

class LetterFrequencyTest < MiniTest::Unit::TestCase
  def test_get_frequencies_short
    string = "abcabc"
    hash = { :a => 2, :b => 2, :c => 2 }
    assert_equal hash, LetterFrequency.get_frequencies(string)
  end

  def test_get_frequencies_long
    string = "abcccabaaaaabbbcccceeeegaaaabaccafffff"
    hash = { :a => 13, :b => 6, :c => 9, :e => 4, :f => 5, :g => 1 }
    assert_equal hash, LetterFrequency.get_frequencies(string)
  end

  def test_parallel_get_frequencies_short
    string = "abcabc"
    hash = { :a => 2, :b => 2, :c => 2 }
    assert_equal hash, LetterFrequency.parallel_get_frequencies(string, 4)
  end

  def test_parallel_get_frequencies_long
    string = "abcccabaaaaabbbcccceeeegaaaabaccafffff"
    hash = { :a => 13, :b => 6, :c => 9, :e => 4, :f => 5, :g => 1 }
    assert_equal hash, LetterFrequency.parallel_get_frequencies(string, 5)
  end
end
