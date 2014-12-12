class FixedArray
  attr_reader :size

  def initialize(size)
    @size = size
    @array = Array.new(@size)
  end

  def set(index, element)
    @array[index] = element unless out_of_bounds?(index)
  end

  def get(index)
    @array[index] unless out_of_bounds?(index)
  end

  private

  def out_of_bounds?(index)
    raise IndexError if index < 0 || index >= @size
  end
end
