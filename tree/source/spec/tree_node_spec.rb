require_relative '../tree_node'

describe TreeNode do
  let(:value) { 1 }
  let(:other_value) { 2 }
  let(:node) { TreeNode.new(value) }
  let(:other_node) { TreeNode.new(other_value) }

  describe "#new(value)" do
    it "creates a new TreeNode object" do
      expect(node).to be_a TreeNode
    end

    it "sets the node's value to the passed value" do
      expect(node.value).to eq value
    end
  end

  describe "#value" do
    it "returns the value of the node" do
      expect(node.value).to eq value
    end
  end

  describe "#add_child(child)" do
    it "adds child to children of the node" do
      expect {
        node.add_child(other_node)
      }.to change { node.children.size }.by 1
    end
  end

  describe "#children" do
    it "returns a collection of child nodes" do
      node.add_child(other_node)
      children = node.children
      children.size.times do |i|
        expect(children.get(i)).to be_a TreeNode
      end
    end
  end
end
