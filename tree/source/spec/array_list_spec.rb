require_relative '../array_list'

describe ArrayList do
  let(:size) { 1 }
  let(:el) { 1 }
  let(:new_el) { 2 }
  let(:array_list) { ArrayList.new(size) }

  describe "#new" do
    it "returns the list" do
      expect(array_list).to be_a ArrayList
    end
  end

  describe "#add" do
    it "adds element to the end of the list" do
      array_list.add(el)
      expect(array_list.get(0)).to eq el
    end

    it "dynamically increases the size of the underlying array" do
      array_list.add(el)
      array_list.add(new_el)
      expect(array_list.get(1)).to eq new_el
    end

    it "returns the element" do
      expect(array_list.add(el)).to eq el
    end
  end

  describe "#get" do
    before { array_list.add(el) }

    context "index contains an element" do
      it "returns the element at index" do
        expect(array_list.get(0)).to eq el
      end
    end

    context "index does not contain an existing element" do
      it "raises an IndexError" do
        expect { array_list.get(-1) }.to raise_error IndexError
        expect { array_list.get(1) }.to raise_error IndexError
      end
    end
  end

  describe "#set" do
    before { array_list.add(el) }

    context "index contains an existing element" do
      it "replaces existing element at index" do
        array_list.set(0, new_el)
        expect(array_list.get(0)).to eq new_el
      end

      it "returns the new element" do
        expect(array_list.set(0, new_el)).to eq new_el
      end
    end

    context "index does not contain an existing element" do
      it "raises an IndexError" do
        expect { array_list.set(-1, new_el) }.to raise_error IndexError
        expect { array_list.set(1, new_el) }.to raise_error IndexError
      end
    end
  end

  describe "#size" do
    it "returns the size of the list" do
      array_list.add(el)
      expect(array_list.size).to eq 1
    end
  end

  describe "#insert" do
    before { array_list.add(el) }

    context "given valid index" do
      it "inserts the element at the front of the list" do
        array_list.insert(0, new_el)
        expect(array_list.get(0)).to eq new_el
        expect(array_list.get(1)).to eq el
      end

      it "inserts the element in the middle of the list" do
        array_list.add(el)
        array_list.insert(1, new_el)
        expect(array_list.get(0)).to eq el
        expect(array_list.get(1)).to eq new_el
        expect(array_list.get(2)).to eq el
      end
    end

    context "given invalid index" do
      it "raises an IndexError" do
        expect { array_list.insert(1, new_el) }.to raise_error IndexError
      end
    end
  end
end
