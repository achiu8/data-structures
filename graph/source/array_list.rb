require_relative 'fixed_array'

class ArrayList
  attr_accessor :size

  def initialize(size = 0)
    @size = 0
    @fixed_array = FixedArray.new(size)
  end

  def add(element)
    begin
      @fixed_array.set(@size, element)
      @size += 1
    rescue
      double_size
      add(element)
    end
  end

  def get(index)
    @fixed_array.get(index) unless out_of_bounds?(index)
  end

  def set(index, element)
    @fixed_array.set(index, element) unless out_of_bounds?(index)
  end

  def insert(index, element)
    unless out_of_bounds?(index)
      old_element = get(index)
      if index == @size - 1
        add(old_element)
      else
        insert(index + 1, old_element)
      end
      set(index, element)
    end
  end

  private
  
  def out_of_bounds?(index)
    raise IndexError if index < 0 || index >= @size
  end

  def double_size
    new_fixed_array = FixedArray.new(@fixed_array.size * 2)
    @fixed_array.size.times do |index|
      new_fixed_array.set(index, @fixed_array.get(index))
      @size = index + 1
    end
    @fixed_array = new_fixed_array
  end
end
