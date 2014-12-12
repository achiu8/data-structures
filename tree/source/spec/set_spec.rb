require_relative '../set'

describe MySet do
  let(:set) { MySet.new }
  let(:element) { 1 }
  let(:repeat_element) { 1 }
  let(:new_element) { 2 }
  let(:values) { [1, 2, 3, 4, 5] }
  let(:other_values) { [6, 7, 8, 9] }
  let(:similar_values) { [1, 2, 3, 4, 5] }
  let(:all_values) { values + other_values }
  let(:other_set) { MySet.new }
  let(:similar_set) { MySet.new }
  let(:empty_set) { MySet.new }

  describe "#new" do
    it "creates a new empty Set object" do
      expect(set).to be_a MySet
    end
  end

  describe "#add(element)" do
    it "adds element to set if not already present" do
      set.add(element)
      expect(set.contains?(element)).to be true
      expect(set.size).to eq 1
    end

    it "doesn't add element to set if already present" do
      set.add(element)
      set.add(repeat_element)
      expect(set.size).to eq 1
    end
  end

  describe "#remove(element)" do
    before { set.add(element) }

    it "removes element from set if present" do
      set.remove(element)
      expect(set.contains?(element)).to be false
      expect(set.size).to eq 0
    end
  end

  describe "#contains?(element)" do
    before { set.add(element) }
    
    it "returns true if element in set" do
      expect(set.contains?(element)).to be true
    end

    it "returns false if element not in set" do
      expect(set.contains?(new_element)).to be false
    end
  end

  describe "#iterate { |element| block }" do
    let(:size) { 5 }
    before { size.times { |value| set.add(value) } }

    it "iterates through all elements of set and performs given block" do
      expect { |b| set.iterate(&b) }.to yield_control.exactly(size).times
    end
  end

  describe "#size" do
    let(:values) { [1, 2, 3, 4, 5] }
    before { values.each { |value| set.add(value) } }

    it "returns the size of the set" do
      expect(set.size).to eq values.length
    end
  end

  describe "#union(other_set)" do
    before { values.each { |value| set.add(value) } }
    before { other_values.each { |value| other_set.add(value) } }
    before { similar_values.each { |value| similar_set.add(value) } }

    context "given two different sets" do
      it "returns all values from both sets" do
        new_set = set.union(other_set)
        all_values.each do |value|
          expect(new_set.contains?(value)).to be true
        end
      end

      it "does not contain any duplicate values" do
        new_set = set.union(other_set)
        size = all_values.uniq.length
        expect(new_set.size).to eq size
      end
    end

    context "given two of the same sets" do
      it "returns all values from both sets" do
        new_set = set.union(similar_set)
        values.each do |value|
          expect(new_set.contains?(value)).to be true
        end
      end

      it "does not contain any duplicate values" do
        new_set = set.union(similar_set)
        size = values.uniq.length
        expect(new_set.size).to eq size
      end
    end

    context "given an empty set" do
      it "returns set" do
        new_set = set.union(empty_set)
        values.each do |value|
          expect(new_set.contains?(value)).to be true
        end
      end
    end
  end

  describe "#intersection(other_set)" do
    before { values.each { |value| set.add(value) } }
    before { other_values.each { |value| other_set.add(value) } }
    before { similar_values.each { |value| similar_set.add(value) } }

    context "given two different sets" do
      it "returns empty set" do
        new_set = set.intersection(other_set)
        expect(new_set.size).to eq 0
      end
    end

    context "given two of the same sets" do
      it "returns all values" do
        new_set = set.intersection(similar_set)
        values.each do |value|
          expect(new_set.contains?(value)).to be true
        end
      end
    end

    context "given an empty set" do
      it "returns empty set" do
        new_set = set.intersection(empty_set)
        expect(new_set.size).to eq 0
      end
    end
  end

  describe "#difference(other_set)" do
    before { values.each { |value| set.add(value) } }
    before { other_values.each { |value| other_set.add(value) } }
    before { similar_values.each { |value| similar_set.add(value) } }

    context "given two different sets" do
      it "returns set" do
        diff_values = values - other_values
        new_set = set.difference(other_set)
        values.each do |value|
          expect(new_set.contains?(value)).to be true
        end
      end
    end

    context "given two of the same sets" do
      it "returns empty set" do
        new_set = set.difference(similar_set)
        expect(new_set.size).to eq 0
      end
    end

    context "given an empty set" do
      it "returns set" do
        new_set = set.difference(empty_set)
        values.each do |value|
          expect(new_set.contains?(value)).to be true
        end
      end
    end
  end

  describe "#subset?(other_set)" do
    before { values.each { |value| set.add(value) } }
    before { other_values.each { |value| other_set.add(value) } }
    before { similar_values.each { |value| similar_set.add(value) } }

    it "returns false for completey different set" do
      expect(set.subset?(other_set)).to be false
    end

    it "returns true for similar set" do
      expect(set.subset?(similar_set)).to be true
    end

    it "returns true for empty set" do
      expect(set.subset?(empty_set)).to be true
    end
  end
end
