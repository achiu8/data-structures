require_relative 'tree_node'

class Tree
  attr_reader :root

  def initialize(node)
    @root = node
  end

  def search(node = @root, &block)
    children = node.children
    children.size.times do |i|
      child = children.get(i)
      return child if block.call(child.value) == true

      returned = search(child, &block)
      return returned if returned
    end
    nil
  end
end
