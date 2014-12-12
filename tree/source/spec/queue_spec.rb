require_relative '../queue'

describe Queue do
  let(:first_element) { 1 }
  let(:second_element) { 2 }
  let(:queue) { Queue.new }

  before do
    queue.enqueue(first_element)
    queue.enqueue(second_element)
  end

  describe "#new" do
    it "creates a new queue object" do
      expect(queue).to be_a Queue
    end
  end

  describe "#enqueue(element)" do
    it "adds element to the end of the queue" do
      expect(queue.peek).to eq first_element
      expect(queue.empty?).to be false
    end
  end

  describe "#dequeue" do
    it "removes and returns the first element of the queue" do
      dequeued = queue.dequeue
      expect(dequeued).to eq first_element
      expect(queue.peek).to eq second_element
    end

    it "returns nil if queue empty" do
      queue.dequeue
      queue.dequeue
      expect(queue.dequeue).to be_nil
    end
  end

  describe "#peek" do
    let(:peek) { queue.peek }

    it "returns the first element of the queue" do
      expect(peek).to eq first_element
    end

    it "returns nil if queue empty" do
      queue.dequeue
      queue.dequeue
      expect(queue.peek).to be_nil
    end

    it "does not remove the element from the queue" do
      expect(queue.peek).to eq peek
    end
  end

  describe "#empty?" do
    it "returns false when queue not empty" do
      expect(queue.empty?).to be false
    end

    it "returns true when queue empty" do
      queue.dequeue
      queue.dequeue
      expect(queue.empty?).to be true
    end
  end
end
