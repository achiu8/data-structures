require_relative 'array_list'

class TreeNode
  attr_reader :value, :children

  def initialize(value)
    @value = value
    @children = ArrayList.new
  end

  def add_child(child)
    @children.add(child)
  end
end
