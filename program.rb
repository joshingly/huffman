#!/usr/bin/env ruby

require_relative 'lib/huffman'

puts "Generating test string..."

test = (0...10000).map{ ('a'..'z').to_a[rand(26)] }.join

puts "String generated, running..."

start = Time.now
sequential = Huffman.encode(test)
finish = Time.now

puts "Sequential: #{ finish - start }"

start = Time.now
parallel = Huffman.parallel_encode(test, 4)
finish = Time.now

puts "Parallel: #{ finish - start }"

puts "YAY" if sequential == parallel
