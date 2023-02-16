# Создать свой аналог класса Array, String, Hash (на выбор).
# При этом все методы класса должны хранится в разделенных по смыслу модулях (модули создание, добавления,
# удаления, вывода, каких-либо изменений

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

module Printable
  def print
    puts data.to_s
  end
end

class CustomArray
  include Removable
  include Addable
  include Updatable
  include Printable

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

my_array.print
