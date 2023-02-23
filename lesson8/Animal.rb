# Создать класс Animal и расширяющие его классы Dog, Cat, Horse.
# Класс Animal должен содержать переменную класса, отвечающую за количество созданных объектов.
# Также у него должен быть метод класса, выводящий это количество

class Animal

  @@total = 0

  attr_reader :food, :location, :animal

  def initialize(food, location)
    @@total += 1
    @food = food
    @location = location
  end

  def make_noise
    puts "#{animal} говорит"
  end

  def eat
    puts "#{animal} ест"
  end

  def sleep
    puts "#{animal} спит"
  end

  def self.log_total
    @@total
  end
end

class Dog < Animal
  
  attr_reader :breed
  
  def initialize(food, location, breed)
    @animal = 'Собака'
    @breed = breed
    super(food, location)
  end

  def make_noise
    puts "Встаёт на задние лапы и гавкает"
  end

  def eat
    puts 'Ест и чавкает'
  end
end

class Cat < Animal

  attr_reader :breed

  def initialize(food, location, breed)
    @breed = breed
    @animal = 'Кошка'
    super(food, location)
  end
end

class Horse < Animal

  attr_reader :breed

  def initialize(food, location, breed)
    @breed = breed
    @animal = 'Лошадь'
    super(food, location)
  end
end

class Vet

  def treatAnimal(animal)
    puts "Animal eats: #{animal.food}. \n Animal is in #{animal.location}"
  end
end

cat = Cat.new('Acana', 'Izmir', 'Siamese')
dog = Dog.new('Grandorf', 'Minsk', 'Pug')
horse = Horse.new('Grass', 'Netherlands', 'Arabian')

puts Animal.log_total #=> 3

dog.make_noise #=> Собака говорит
cat.make_noise #=> Кошка говорит
cat.breed #=> Siamese
horse.eat #=> Лошадь ест
dog.eat #=> Ест и чавкает

