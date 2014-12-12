require_relative 'tree_list_node'
require_relative 'array_list'

class TreeList
  attr_reader :root, :size

  def initialize(node = TreeListNode.new(nil))
    @root = node
    @size = @root.value ? 1 : 0
  end

  def add(element, node = @root)
    if node.value.nil?
      node.value = element
      @size += 1
    else
      new_node = TreeListNode.new(element)
      if element < node.value
        if node.left
          add(element, node.left)
        else
          node.left = TreeListNode.new(element)
          @size += 1
        end
      elsif element > node.value
        if node.right
          add(element, node.right)
        else
          node.right = TreeListNode.new(element)
          @size += 1
        end
      else
        return
      end
    end
  end

  def find(element)
    els = ArrayList.new
    each do |value|
      els.add(value)
      break if value == element
    end
    els.size - 1
  end

  def each(node = @root, &block)
    each(node.left, &block) if node.left
    block.call(node.value)
    each(node.right, &block) if node.right
  end
end
