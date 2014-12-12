require_relative '../graph_node'

describe GraphNode do
  let(:value) { 1 }
  let(:other_value) { 2 }
  let(:third_value) { 3 }
  let(:fourth_value) { 3 }
  let(:node) { GraphNode.new(value) }
  let(:other_node) { GraphNode.new(other_value) }
  let(:third_node) { GraphNode.new(third_value) }
  let(:fourth_node) { GraphNode.new(fourth_value) }

  describe "#new" do
    it "creates a new GraphNode object" do
      expect(node).to be_a GraphNode
    end
  end

  describe "#add_edge(other_node)" do
    it "increases nodes by 1" do
      expect { node.add_edge(other_node) }.to change { node.nodes.size }.by 1
    end
  end

  describe "#value" do
    it "returns value of node" do
      expect(node.value).to eq value
    end
  end

  describe "#nodes" do
    it "returns collection of nodes" do
      node.add_edge(other_node)
      node.add_edge(third_node)
      nodes = node.nodes
      nodes.size.times do |i|
        expect(nodes.get(i)).to be_a GraphNode
      end
    end
  end

  describe "#exists?(&block)" do
    it "returns true if any direct descendants cause block to be true" do
      node.add_edge(other_node)
      node.add_edge(third_node)
      expect(node.exists? { |node| node.value == other_value }).to be true
      expect(node.exists? { |node| node.value == third_value }).to be true
    end

    it "returns true if any descendants cause block to be true" do
      third_node.add_edge(fourth_node)
      other_node.add_edge(third_node)
      node.add_edge(other_node)
      expect(node.exists? { |node| node.value == third_value }).to be true
    end

    it "works for cyclic graphs" do
      fourth_node.add_edge(node)
      third_node.add_edge(fourth_node)
      other_node.add_edge(third_node)
      node.add_edge(other_node)
      [value, other_value, third_value, fourth_value].each do |value|
        expect(node.exists? { |node| node.value == value }).to be true
      end
    end

    it "returns false if no descendants cause block to be true" do
      expect(node.exists? { |node| node.value == value }).to be false
    end
  end
end
