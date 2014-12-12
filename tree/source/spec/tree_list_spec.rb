require_relative '../tree_list'

describe TreeList do
  let(:node) { TreeListNode.new(1) }
  let(:tree) { TreeList.new(node) }

  before do
    tree.add(2)
    tree.add(3)
  end

  describe "#new" do
    it "creates a new TreeList object" do
      expect(tree).to be_a TreeList
    end
  end

  describe "#add(element)" do
    it "adds element to the list" do
      expect(tree.size).to eq 3
    end
  end

  describe "#find(element)" do
    it "returns the position of element in the list" do
      expect(tree.find(2)).to eq 1
    end
  end

  describe "#size" do
    it "returns the size of the list" do
      expect(tree.size).to eq 3
    end
  end

  describe "#each(&block)" do
    it "iterates through the list in order" do
      values = []
      tree.each { |value| values << value }
      expect(values).to eq [1, 2, 3]
    end
  end
end
