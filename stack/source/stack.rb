require_relative 'linked_list'

class Stack
  def initialize
    @stack = LinkedList.new
  end

  def push(element)
    @stack.insert_first(element)
  end

  def pop
    value = top
    @stack.remove_first
    value
  end

  def top
    @stack.head.value if @stack.head
  end

  def empty?
    @stack.size == 0
  end
end
