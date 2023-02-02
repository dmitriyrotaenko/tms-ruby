# По диаграмме (из слайда №6 ) классов создать иерархию. Реализовать все принципы ООП


class Mammal
  WARM_BLOODED = true
  BORN_ALIVE = true

  attr_reader :sex, :have_fur

  def initialize(sex, have_fur)
    @sex = sex
    @have_fur = have_fur
  end

  def make_sound; end

  def eat
    puts 'Eats food...'
  end

  def sleep
    puts 'Sleeps...'
  end
end

class Horse < Mammal

  SLEEP_STANDING = true

  attr_reader :color

  def initialize(sex, have_fur, color)
    @color = color
    super(sex, have_fur)
  end
end

class Palomino < Horse
  # Something
end

class Elephant < Mammal

  attr_reader :weight

  def initialize(sex, have_fur, weight)
    @weight = weight
    super(sex, have_fur)
  end

  def make_sound
    puts 'Trumpet sound...'
  end
end

class Cat < Mammal

  attr_reader :breed, :zoomies

  def initialize(sex, have_fur)
    @zoomies = false
    super
  end

  def make_sound
    puts 'Meow'
  end

  def eat
    super
    @zoomies = true
  end
end

class Dog < Mammal
  MAX_LITTER = 5

  attr_reader :puppies

  def initialize(sex, have_fur)
    @puppies = 0
    super(sex, have_fur)
  end

  def make_sound
    puts 'Woof'
  end

  def play_with_stick
    puts 'Playing with a stick...'
  end

  def give_birth
    @puppies += rand(1..MAX_LITTER) if @sex == 'female'
  end
end

class GermanShepard < Dog
  # something
end


# Cats
mia = Cat.new('Siamese', true)
leopold = Cat.new('Sphynx', false)
mia.eat
leopold.make_sound

# Dogs
rex = GermanShepard.new('male', true)
sara = GermanShepard.new('female', true)

rex.make_sound
sara.give_birth
sara.puppies #=> 1..5

# Elephant

dumbo = Elephant.new('male', false, 5000)
dumbo.make_sound
