require_relative '../tree'

describe Tree do
  let(:node) { TreeNode.new(1) }
  let(:tree) { Tree.new(node) }

  describe "#new" do
    it "creates a new Tree object" do
      expect(tree).to be_a Tree
    end

    it "sets the passed node as the root" do
      expect(tree.root).to eq node
    end
  end

  describe "#search(&block)" do
    before do
      root = TreeNode.new("<body id='foo'>")
      node2 = TreeNode.new("<h1 id='bang'>")
      node3 = TreeNode.new("<div id='bar-box'>")
      @node4 = TreeNode.new("<div id='baz-box'>")
      root.add_child(node2)
      root.add_child(node3)
      node3.add_child(@node4)
      @tree = Tree.new(root)
    end

    it "returns the first node for which the block is true" do
      returned = @tree.search { |value| value == "<div id='baz-box'>" }
      expect(returned).to eq @node4
    end

    it "returns nil if no node is found" do
      expect(@tree.search { |value| value == "<div id='buzz'>" }).to be_nil
    end
  end
end
