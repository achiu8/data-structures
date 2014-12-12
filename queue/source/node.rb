class Node
  attr_accessor :value
  attr_reader :prev, :next

  def initialize(element)
    @value = element
    @prev = nil
    @next = nil
  end

  def insert_after(other_node)
    @next = other_node
  end

  def remove_after
    @next = nil
  end

  def insert_before(other_node)
    @prev = other_node
  end

  def remove_before
    @prev = nil
  end
end
