require_relative 'linked_list'

class MySet
  attr_accessor :set

  def initialize
    @set = LinkedList.new
  end

  def add(element)
    @set.insert_last(element) unless contains?(element)
  end

  def remove(element)
    if size == 1 && @set.head.value == element
      @set.remove_first
    else
      iterate do |node|
        if node.value == element
          if node.next && node.prev.nil?
            node.next.prev = nil
          elsif node.prev && node.next.nil?
            node.prev.next = nil
          else
            node.prev.next = node.next
          end
        end
      end
    end
  end

  def union(other_set)
    new_set = MySet.new
    iterate { |node| new_set.add(node.value) }
    other_set.iterate { |node| new_set.add(node.value) }
    new_set
  end

  def intersection(other_set)
    new_set = MySet.new
    other_set.iterate { |node| new_set.add(node.value) if contains?(node.value) }
    new_set
  end

  def difference(other_set)
    new_set = MySet.new
    iterate { |node| new_set.add(node.value) if !other_set.contains?(node.value) }
    new_set
  end

  def subset?(other_set)
    subset = true
    other_set.iterate { |node| subset = contains?(node.value) }
    subset
  end

  def contains?(element)
    iterate do |node|
      return true if node.value == element
    end
    false
  end

  def iterate(&block)
    node = @set.head
    size.times do
      block.call(node)
      node = node.next
    end
  end

  def size
    @set.size
  end
end
