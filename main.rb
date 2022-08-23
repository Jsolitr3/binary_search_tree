module Comparable
  def compare(node1, node2)

  end
end

class Tree
  attr_accessor :root

  def initialize(array = [1,1,2,3])
    check = array.uniq
    check.nil? ? array.sort! : array.sort!.uniq!
    @root = build_tree(array)
  end

  def build_tree(array)
    return Node.new(array) if array.length == 1
    return nil if array.length == 0
    mid = array.length/2
    
    left = build_tree(array[0..mid-1])
    right = build_tree(array[mid+1..-1])
    return Node.new(array[mid], left, right)
  end

  def display_tree(queue = [@root])
    newQueue = []
    queue.each do |node|
      print "|#{node.data}|"
      newQueue.push(node.left_node) unless node.left_node.nil?
      newQueue.push(node.right_node) unless node.right_node.nil?
    end
      puts ""
      display_tree(newQueue) unless newQueue.all?{|node| node.data.nil?}

  end

end

class Node
  attr_accessor :data
  attr_accessor :left_node
  attr_accessor :right_node

  def initialize(data = nil, leftNode = nil, rightNode = nil)
    @data = data
    @right_node = rightNode
    @left_node = leftNode
  end
  
  def children
    return 0 if @left_node.nil? && @right_node.nil?
    return 2 unless @left_node.nil? || @right_node.nil?
    return 1 
  end

end

def generate_array(length, num1, num2)
  array = []
  if num1 <= num2 
    min = num1
    max = num2
  else
    max = num1
    min = num2
  end
  length.times do
    array.push(rand(min..max))
  end
  #p array
  array
end

tree = Tree.new(generate_array(40,0,1000))
tree.display_tree()
