require_relative '../stack'

describe Stack do
  let(:first_element) { 1 }
  let(:second_element) { 2 }
  let(:stack) { Stack.new }

  before do
    stack.push(first_element)
    stack.push(second_element)
  end

  describe "#new" do
    it "creates a new Stack object" do
      expect(stack).to be_a Stack
    end
  end

  describe "#push(element)" do
    it "adds element to the top of the stack" do
      expect(stack.top).to eq second_element
      expect(stack.empty?).to be false
    end
  end

  describe "#pop" do
    it "removes and returns the top element of the stack" do
      popped = stack.pop
      expect(popped).to eq second_element
      expect(stack.top).to eq first_element
    end

    it "returns nil if stack empty" do
      stack.pop
      stack.pop
      expect(stack.pop).to be_nil
    end
  end

  describe "#top" do
    let(:top) { stack.top }

    it "returns the top element of the stack" do
      expect(top).to eq second_element
    end

    it "returns nil if stack empty" do
      stack.pop
      stack.pop
      expect(stack.top).to be_nil
    end

    it "does not remove the element from the stack" do
      expect(stack.top).to eq top
    end
  end

  describe "#empty?" do
    it "returns false when stack not empty" do
      expect(stack.empty?).to be false
    end

    it "returns true when stack empty" do
      stack.pop
      stack.pop
      expect(stack.empty?).to be true
    end
  end
end
