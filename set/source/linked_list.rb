require_relative 'node'

class LinkedList
  attr_reader :size
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def insert_first(element)
    new_node = Node.new(element)
    if @head
      old_head = @head
      @head = new_node
      @head.insert_after(old_head)
      old_head.insert_before(@head)
    else
      @head, @tail = new_node, new_node
    end
    @size += 1
  end

  def remove_first
    if @head
      old_head = @head
      @head = @head.next
      @head ? @head.remove_before : @tail = nil
      @size -= 1
      old_head
    end
  end

  def insert_last(element)
    new_node = Node.new(element)
    if @tail
      old_tail = @tail
      @tail = new_node
      old_tail.insert_after(@tail)
      @tail.insert_before(old_tail)
    else
      @head, @tail = new_node, new_node
    end
    @size += 1
  end

  def remove_last
    if @tail
      old_tail = @tail
      @tail = @tail.prev
      @tail ? @tail.remove_after : @head = nil
      @size -= 1
      old_tail
    end
  end

  def get(index)
    traverse_to(index) { |node| node.value }
  end

  def set(index, element)
    traverse_to(index) { |node| node.value = element }
  end

  private

  def out_of_bounds?(index)
    raise IndexError if index < 0 || index >= @size
  end

  def traverse_to(index, &block)
    unless out_of_bounds?(index)
      current_index = 0
      current_node = @head
      until current_index == index
        current_node = current_node.next
        current_index += 1
      end
      block.call(current_node)
    end
  end
end
