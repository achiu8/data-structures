require_relative '../fixed_array'

describe FixedArray do
  let(:size) { 5 }
  let(:el) { 1 }
  let(:fixed_array) { FixedArray.new(size) }
  let(:new_el) { fixed_array.set(0, el) }

  describe "#new" do
    it "returns the array" do
      expect(fixed_array).to be_a FixedArray
    end

    it "has a specified size" do
      expect(fixed_array.size).to eq size
    end
  end

  describe "#get" do
    it "returns the requested element if index within bounds" do
      new_el
      expect(fixed_array.get(0)).to eq el
    end

    it "throws an IndexError if index outside bounds" do
      expect { fixed_array.get(-1) }.to raise_error IndexError
      expect { fixed_array.get(size) }.to raise_error IndexError
    end
  end

  describe "#set" do
    it "returns the set element if index within bounds" do
      expect(new_el).to eq el
    end

    it "throws an IndexError if index outside bounds" do
      expect { fixed_array.set(-1, el) }.to raise_error IndexError
      expect { fixed_array.set(size, el) }.to raise_error IndexError
    end
  end
end
