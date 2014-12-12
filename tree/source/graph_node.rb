require_relative 'array_list'
require_relative 'queue'
require_relative 'set'

class GraphNode
  attr_reader :value, :nodes

  def initialize(value)
    @value = value
    @nodes = ArrayList.new
  end

  def add_edge(other_node)
    @nodes.add(other_node)
  end
  
  def exists?(&block)
    explored = MySet.new
    unexplored = Queue.new
    @nodes.size.times { |i| unexplored.enqueue(@nodes.get(i)) }

    until unexplored.empty?
      node = unexplored.dequeue
      explored.add(node)
      return true if block.call(node) == true

      nodes = node.nodes
      nodes.size.times do |i|
        unexplored.enqueue(nodes.get(i)) unless explored.contains?(nodes.get(i))
      end
    end
    false
  end
end
