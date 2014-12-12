require_relative '../linked_list'

describe LinkedList do
  let(:head_element) { 1 }
  let(:tail_element) { 2 }
  let(:new_element) { 3 }
  let(:linked_list) { LinkedList.new }

  describe "#new" do
    it "creates a new LinkedList object" do
      expect(linked_list).to be_a LinkedList
    end
  end

  describe "#insert_first(element)" do
    before { linked_list.insert_first(head_element) }

    it "inserts a node at the front of the list" do
      expect(linked_list.head).to be_a Node
      expect(linked_list.head).to_not be_nil
    end

    it "assigns the head node's value to element" do
      expect(linked_list.head.value).to eq head_element
    end

    it "updates old head prev pointer to new head" do
      linked_list.insert_first(head_element)
      expect(linked_list.head.next.prev).to eq linked_list.head
    end
  end

  describe "#remove_first" do
    context "when only 1 element" do
      before { linked_list.insert_first(head_element) }

      it "removes sole element" do
        linked_list.remove_first
        expect(linked_list.head).to be_nil
        expect(linked_list.tail).to be_nil
        expect(linked_list.size).to eq 0
      end
    end

    context "when head node present and more than 1 element" do
      before do
        linked_list.insert_first(head_element)
        linked_list.insert_last(tail_element)
        linked_list.remove_first
      end

      it "removes the element at the front of the list" do
        expect(linked_list.head).to eq linked_list.tail
      end

      it "sets prev value of new head to nil" do
        expect(linked_list.head.prev).to be_nil
      end
    end

    context "when head node absent" do
      it "returns nil" do
        removed = linked_list.remove_first
        expect(removed).to be_nil
      end
    end
  end

  describe "#insert_last(element)" do
    before { linked_list.insert_last(tail_element) }

    it "inserts an element at the back of the list" do
      expect(linked_list.tail).to be_a Node
      expect(linked_list.head).to_not be_nil
    end

    it "assigns the tail node's value to element" do
      expect(linked_list.tail.value).to eq tail_element
    end

    it "assigns new tail prev pointer to old tail" do
      old_tail = linked_list.tail
      linked_list.insert_last(tail_element)
      expect(linked_list.tail.prev).to eq old_tail
    end
  end

  describe "#remove_last" do
    context "when only 1 element" do
      before { linked_list.insert_first(head_element) }

      it "removes sole element" do
        linked_list.remove_last
        expect(linked_list.head).to be_nil
        expect(linked_list.tail).to be_nil
        expect(linked_list.size).to eq 0
      end
    end

    context "when tail node present and more than 1 element" do
      before do
        linked_list.insert_first(head_element)
        linked_list.insert_last(tail_element)
        linked_list.remove_last
      end

      it "removes the element at the back of the list" do
        expect(linked_list.tail).to eq linked_list.head
      end

      it "sets next value of new tail to nil" do
        expect(linked_list.tail.next).to be_nil
      end
    end

    context "when tail node absent" do
      it "returns nil" do
        removed = linked_list.remove_last
        expect(removed).to be_nil
      end
    end
  end

  describe "#get(index)" do
    before do
      linked_list.insert_first(head_element)
      linked_list.insert_last(tail_element)
    end

    context "when index in bounds" do
      it "returns element at index" do
        el = linked_list.get(1)
        expect(el).to eq tail_element
      end
    end

    context "when index out of bounds" do
      it "raises IndexError" do
        expect { linked_list.get(2) }.to raise_error IndexError
      end
    end
  end

  describe "#set(index, element)" do
    before do
      linked_list.insert_first(head_element)
      linked_list.insert_last(tail_element)
    end

    context "when index in bounds" do
      it "sets the element at index" do
        linked_list.set(1, new_element)
        expect(linked_list.get(1)).to eq new_element
      end
    end

    context "when index out of bounds" do
      it "raises IndexError" do
        expect { linked_list.set(2, new_element) }.to raise_error IndexError
      end
    end
  end

  describe "#size" do
    let(:size) { 5 }

    before { 5.times { linked_list.insert_first(new_element) } }

    it "returns the size of the list" do
      expect(linked_list.size).to eq size
    end
  end
end
