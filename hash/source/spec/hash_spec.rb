require_relative '../hash'

describe MyHash do
  let(:hash) { MyHash.new }
  let(:key) { "foo" }
  let(:other_key) { "fizz" }
  let(:value) { "bar" }
  let(:other_value) { "buzz" }

  describe "#new" do
    it "creates a new Hash object" do
      expect(hash).to be_a MyHash
    end
  end

  describe "#set(key, value)" do
    it "replaces existing value if key present" do
      hash.set(key, value)
      hash.set(key, other_value)
      expect(hash.get(key)).to eq other_value
    end

    it "adds new key-value pair if key not present" do
      hash.set(key, value)
      expect(hash.get(key)).to eq value
    end

    context "when collision of hashed keys" do
      before do
        allow(hash).to receive(:hashed).and_return 0
        hash.set(key, value)
        hash.set(other_key, other_value)
      end

      it "still adds new key-value pair" do
        expect(hash.has_key?(key)).to be true
      end

      it "can get each value" do
        expect(hash.get(key)).to eq value
        expect(hash.get(other_key)).to eq other_value
      end
    end
  end

  describe "#get(key)" do
    it "returns value stored at key if key present" do
      hash.set(key, value)
      expect(hash.get(key)).to eq value
    end

    it "raises KeyError if key not present" do
      expect { hash.get(key) }.to raise_error KeyError
    end
  end

  describe "#has_key?(key)" do
    it "returns true if key present" do
      hash.set(key, value)
      expect(hash.has_key?(key)).to be true
    end

    it "returns false if key not present" do
      expect(hash.has_key?(key)).to be false
    end
  end

  describe "#remove(key)" do
    it "removes the entry stored at key if key present" do
      hash.set(key, value)
      hash.remove(key)
      expect(hash.has_key?(key)).to be false
    end

    it "raises KeyError if key not present" do
      expect { hash.remove(key) }.to raise_error KeyError
    end
  end

  describe "#iterate(&block)" do
    before do
      hash.set(key, value)
      hash.set(other_key, other_value)
    end

    it "iterates through each key-value pair" do
      expect { |b| hash.iterate(&b) }.to yield_control.exactly(hash.size).times
    end
  end

  describe "#rehash" do
    it "maintains a load factor of less than 1" do
      100.times do |i|
        hash.set(i, i)
        expect(hash.load_factor).to be <= 1
      end
    end

    it "maintains all existing keys" do
      keys = (1..8).to_a
      keys.each { |i| hash.set(i, i) }
      hash.set(9, 9)
      keys.each do |i|
        expect(hash.has_key?(i)).to be true
      end
    end
  end
end
