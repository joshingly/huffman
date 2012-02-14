require 'rake'
require 'fileutils'
require 'rake/testtask'

task "default" => ["test"]

Rake::TestTask.new do |t|
  t.options = "-v"
  t.verbose = false
  t.warning = true

  t.libs << ["test", "lib/huffman", "lib"]
  t.pattern = "test/**/**_test.rb"
end
