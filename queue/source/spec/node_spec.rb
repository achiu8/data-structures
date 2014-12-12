require_relative '../node'

describe Node do
  let(:element) { 1 }
  let(:node) { Node.new(element) }

  describe "#new" do
    it "creates a new Node object" do
      expect(node).to be_a Node
    end

    it "sets the node's value to the element" do
      expect(node.value).to eq element
    end
  end

  describe "#insert_after(other_node)" do
    let(:other_node) { Node.new(element) }

    before { node.insert_after(other_node) }

    it "sets node's pointer to other_node" do
      expect(node.next).to eq other_node
    end
  end

  describe "#remove_after" do
    it "removes node's pointer value" do
      node.remove_after
      expect(node.next).to be_nil
    end
  end
end
