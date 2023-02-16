
module Addable
  def push(new_element)
    data.push(new_element)
  end

  def unshift(new_element)
    data.unshift(new_element)
  end
end

module Removable
  def pop(items_to_remove = 1)
    data.pop(items_to_remove)
  end

  def shift(items_to_remove = 1)
    data.shift(items_to_remove)
  end
end

module Updatable
  def shuffle
    data.shuffle!
  end
end

class CustomArray
  include Removable
  include Addable
  include Updatable

  attr_reader :data

  def initialize(data = [])
    @data = data
  end
end

my_array = CustomArray.new([1, 2, 3, 4, 5])
my_array.push(6)

my_array.pop(2)

my_array.shift
my_array.shuffle

puts my_array.data.to_s
