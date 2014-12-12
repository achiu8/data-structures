require_relative '../map'

describe Map do
  let(:map) { Map.new }
  let(:key) { "foo" }
  let(:value) { "bar" }
  let(:new_value) { "baz" }
  let(:bad_key) { "test" }

  before { map.set(key, value) }

  describe "#new" do
    it "creates a new Map object" do
      expect(map).to be_a Map
    end
  end

  describe "#set(key, value)" do
    context "when key not yet present" do
      it "adds the key-value pair" do
        expect(map.get(key)).to eq value
      end

      it "returns the value" do
        expect(map.set(key, new_value)).to eq new_value
      end
    end

    context "when key already present" do
      it "replaces the value at the key" do
        map.set(key, new_value)
        expect(map.get(key)).to eq new_value
      end

      it "returns the value" do
        expect(map.set(key, new_value)).to eq new_value
      end
    end
  end

  describe "#get(key)" do
    context "given valid key" do
      it "returns the value at the key" do
        expect(map.get(key)).to eq value
      end
    end

    context "given invalid key" do
      it "raises an error" do
        expect { map.get(bad_key) }.to raise_error KeyError
      end
    end
  end

  describe "#has_key?(key)" do
    it "returns true if key present" do
      expect(map.has_key?(key)).to be true
    end

    it "returns false if key not present" do
      expect(map.has_key?(bad_key)).to be false
    end
  end

  describe "#remove(key)" do
    context "given valid key" do
      it "removes entry stored at key" do
        map.remove(key)
        expect(map.size).to eq 0
      end
    end

    context "given invalid key" do
      it "raises an error" do
        expect { map.remove(bad_key) }.to raise_error KeyError
      end
    end
  end

  describe "#iterate(&block)" do
    it "executes block once for each element in map" do
      map.set("hello", "world")
      map.set("what", "the")
      expect { |b| map.iterate(&b) }.to yield_control.exactly(map.size).times
    end
  end
end
