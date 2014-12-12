class MyHash
  attr_reader :values

  def initialize
    @table_size = 8
    @values = Array.new(@table_size) { [] }
  end

  def set(key, value)
    rehash if load_factor >= 1.0
    remove(key) if has_key?(key)
    @values[hashed(key)] << [key, value]
  end

  def get(key)
    if has_key?(key)
      bucket = @values[hashed(key)]
      pair = bucket.select { |pair| pair.first == key }.first
      pair.last if pair
    else
      raise KeyError
    end
  end

  def has_key?(key)
    bucket = @values[hashed(key)]
    bucket.any? { |pair| pair.first == key }
  end

  def remove(key)
    if has_key?(key)
      bucket = @values[hashed(key)]
      bucket.reject! { |pair| pair.first == key }
    else
      raise KeyError
    end
  end

  def iterate
    @values.each do |bucket|
      bucket.each { |pair| yield(pair.first, pair.last) }
    end
  end

  def size
    @values.map(&:length).inject(:+)
  end

  def load_factor
    size.to_f / @table_size.to_f
  end

  private

  def hashed(key)
    key.to_s.bytes.inject(:+) % @table_size
  end

  def rehash
    existing_pairs = []
    iterate { |key, value| existing_pairs << [key, value] }
    @table_size *= 2
    @values = Array.new(@table_size) { [] }
    existing_pairs.each { |pair| set(pair.first, pair.last) }
  end
end
