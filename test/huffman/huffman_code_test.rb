require 'minitest/autorun'
require_relative '../../lib/huffman/huffman_code'

class HuffmanCodeTest < MiniTest::Unit::TestCase
  def test_simple_code
    freqs = { :a => 13, :b => 6, :c => 9, :e => 4, :f => 5, :g => 1 }
    code = { :b => "00", :c => "01", :f => "100", :g => "1010", :e => "1011", :a => "11" }
    assert_equal code, HuffmanCode.create_code(freqs)
  end
end
