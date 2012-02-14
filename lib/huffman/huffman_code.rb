# construct a tree from a hash of frequencies and return a
# hash of encodings...
# { :A => 001, :B => 010, etc... }

require_relative 'node'

module HuffmanCode
  extend self

  def create_code(frequencies)
    head_node = build_tree(frequencies)
    codes = get_codes(head_node)

    codes
  end

  def build_tree(frequencies)
    nodes = []
    frequencies.each { |letter, frequency| nodes << Node.new(frequency, letter) }

    until nodes.length == 1
      smallest = nodes.min_by { |node| node.value }
      nodes.delete(smallest)

      second_smallest = nodes.min_by { |node| node.value }
      nodes.delete(second_smallest)

      combined = Node.new(smallest.value + second_smallest.value, nil, smallest, second_smallest)
      smallest.parent = combined
      second_smallest.parent = combined

      nodes << combined
    end

    nodes.first
  end

  def get_codes(head_node)
    codes = Hash.new
    traverse_tree(head_node, "", codes)

    codes
  end

  def traverse_tree(head_node, current_code, codes)
    if head_node.left_child.letter == nil
      traverse_tree(head_node.left_child, current_code + "0", codes)
    else
      codes[head_node.left_child.letter] = current_code + "0"
    end

    if head_node.right_child.letter == nil
      traverse_tree(head_node.right_child, current_code + "1", codes)
    else
      codes[head_node.right_child.letter] = current_code + "1"
    end
  end
end
