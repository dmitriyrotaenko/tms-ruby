# Создать класс Animal и расширяющие его классы Dog, Cat, Horse.
# Класс Animal должен содержать переменную класса, отвечающую за количество созданных объектов.
# Также у него должен быть метод класса, выводящий это количество

class Animal
  @@total = 0

  def initialize
    @@total += 1
  end

  def self.log_total
    @@total
  end
end

class Dog < Animal; end
class Cat < Animal; end
class Horse < Animal; end

cat = Cat.new
dog = Dog.new
horse = Horse.new
horse_2 = Horse.new


puts Animal.log_total
