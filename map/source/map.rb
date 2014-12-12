require_relative 'array_list'

class Map
  def initialize
    @keys = ArrayList.new(1)
    @values = ArrayList.new(1)
  end

  def set(key, value)
    index = get_index(key)
    if index > -1
      @values.set(index, value)
    else
      @keys.add(key)
      @values.add(value)
    end
  end

  def get(key)
    index = get_index(key)
    raise KeyError if index < 0
    @values.get(index)
  end

  def has_key?(key)
    get_index(key) > -1
  end

  def remove(key)
    index = get_index(key)
    if index > -1
      last_key = @keys.get(size - 1)
      last_value = @values.get(size - 1)
      @keys.set(index, last_key)
      @values.set(index, last_value)
      @keys.size -= 1
      @values.size -= 1
    else
      raise KeyError
    end
  end

  def iterate(&block)
    size.times do |index|
      key = @keys.get(index)
      value = @values.get(index)
      block.call(key, value)
    end
  end

  def size
    @keys.size
  end

  private

  def get_index(key)
    size.times { |i| return i if @keys.get(i) == key }
    -1
  end
end
