module Comparable
  def compare?(newNode, existingNode)
    newNode > existingNode
  end
end

class Tree
include Comparable
  attr_accessor :root

  def initialize(array = [1,1,2,3])
    check = array.uniq
    check.nil? ? array.sort! : array.sort!.uniq!
    @root = build_tree(array)
  end

  def build_tree(array)
    return Node.new(array[0]) if array.length == 1
    return nil if array.length == 0
    mid = array.length/2
    
    left = build_tree(array[0..mid-1])
    right = build_tree(array[mid+1..-1])
    return Node.new(array[mid], left, right)
  end

  def insert(data)
    return if 

  end

  def inorder(node = @root, array = [])
    return if node.nil?
    inorder(node.left_node, array)
    array.push(node.data)
    inorder(node.right_node, array)
    array
  end

  def postorder(node = @root, array = [])
    return if node.nil?
    postorder(node.left_node, array)    
    postorder(node.right_node, array)
    array.push(node.data)
  end

  def preorder(node = @root, array = [])
    return if node.nil?
    array.push(node.data)
    preorder(node.left_node, array)
    preorder(node.right_node, array)
    array
  end

  def level_order(queue = [@root],array=[])
    newQueue = []
    queue.each do |node|
      array.push(node.data)
      newQueue.push(node.left_node) unless node.left_node.nil?
      newQueue.push(node.right_node) unless node.right_node.nil?
    end
      level_order(newQueue,array) unless newQueue.all?{|node| node.data.nil?}
      array

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

  def children?
    !(@left_node.nil? && @right_node.nil?)
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
p tree.preorder()
p tree.inorder()
p tree.postorder()
p tree.level_order()