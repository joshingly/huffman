require_relative 'huffman/letter_frequency'
require_relative 'huffman/huffman_code'

module Huffman
  extend self

  def encode(string, codes = nil)
    if codes == nil
      frequencies = LetterFrequency.get_frequencies(string)
      codes = HuffmanCode.create_code(frequencies)
    end

    encoded_string = ""
    string.each_char do |char|
      encoded_string << codes[char.to_sym] << "-"
    end

    encoded_string[0..-2]
  end

  def parallel_encode(string, num_threads)
    num_threads = string.length if string.length < num_threads

    threads = []
    encoded_parts = []
    encoded_string = ""

    frequencies = LetterFrequency.parallel_get_frequencies(string, num_threads)
    head_node = HuffmanCode.build_tree(frequencies)
    codes = HuffmanCode.get_codes(head_node)

    partition_size = (string.length.to_f / num_threads.to_f)

    num_threads.times do |i|
      start = partition_size * i
      finish = partition_size * (i + 1)
      threads << Thread.new do
        part = encode(string.slice(start...finish), codes)
        encoded_parts[i] = part
      end
    end

    threads.each { |thread| thread.join }

    encoded_parts.join('-')
  end
end
