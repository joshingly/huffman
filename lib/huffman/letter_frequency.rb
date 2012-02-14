# accepts a string as input and returns a hash with each letter as the key and
# the number of times that letter occurs as the value

module LetterFrequency
  extend self

  def get_frequencies(string)
    frequencies = Hash.new(0)

    string.each_char do |char|
      frequencies[char.to_sym] += 1
    end

    frequencies
  end

  def parallel_get_frequencies(string, num_threads)
    num_threads = string.length if string.length < num_threads

    threads = []
    partial_frequencies = []

    partition_size = (string.length.to_f / num_threads.to_f)

    num_threads.times do |i|
      start = partition_size * i
      finish = partition_size * (i + 1)
      threads << Thread.new do
        partial = get_frequencies(string.slice(start...finish))
        partial_frequencies[i] = partial
      end
    end

    threads.each { |thread| thread.join }

    frequencies = Hash.new(0)
    partial_frequencies.each { |partial| partial.each { |key,value| frequencies[key] += value } }

    frequencies
  end
end
