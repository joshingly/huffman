class Node

  attr_accessor :parent, :left_child, :right_child
  attr_reader :value, :letter

  def initialize(value, letter = nil, left_child = nil, right_child = nil, parent = nil)
    @value = value
    @letter = letter
    @parent = parent
    @left_child = left_child
    @right_child = right_child
  end
end
