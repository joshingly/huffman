require 'minitest/autorun'
require_relative '../lib/huffman'

class HuffmanTest < MiniTest::Unit::TestCase
  def test_encode_string
    string = "abcccabaaaaabbbcccceeeegaaaabaccafffff"
    code = "11-00-01-01-01-11-00-11-11-11-11-11-00-00-00-01-01-01-01-1011-1011-1011-1011-1010-11-11-11-11-00-11-01-01-11-100-100-100-100-100"
    assert_equal code, Huffman.encode(string)
  end

  def test_full_parallel_encode_string
    string = "abcccabaaaaabbbcccceeeegaaaabaccafffff"
    code = "11-00-01-01-01-11-00-11-11-11-11-11-00-00-00-01-01-01-01-1011-1011-1011-1011-1010-11-11-11-11-00-11-01-01-11-100-100-100-100-100"
    assert_equal code, Huffman.parallel_encode(string, 4)
  end
end
