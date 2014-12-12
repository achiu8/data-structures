require_relative 'linked_list'

class Queue
  def initialize
    @queue = LinkedList.new
  end

  def enqueue(element)
    @queue.insert_last(element)
  end

  def dequeue
    value = peek
    @queue.remove_first
    value
  end

  def peek
    @queue.head.value if @queue.head
  end

  def empty?
    @queue.size == 0
  end
end
