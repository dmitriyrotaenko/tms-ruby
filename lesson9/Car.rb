

module Vehicles
  class Car

    attr_reader :model, :cl, :weight, :driver, :engine, :moving

    def initialize(model, cl, weight, driver, engine)
      @model = model
      @cl = cl
      @weight = weight
      @driver = driver
      @engine = engine

      @moving = false
    end

    def start
      moving = true
      puts 'Поехали'
    end

    def stop
      moving = false
      puts 'Останавливаемся'
    end

    def turnLeft
      puts moving ? 'Поворот налево' : 'Сначала заведи мотор'
    end

    def turnRight
      puts moving ? 'Поворот направо' : 'Сначала заведи мотор'
    end

    def to_s
      puts "Автомобиль: #{model}\nКласс: #{cl}\nВодитель: #{driver.full_name}\nДвигатель: #{engine}"
    end
  end
end

module Components
  class Engine
    def initialize(power, mnfc)
      @power = power
      @mnfc = mnfc
    end
  end
end

class Person

  attr_reader :first_name, :last_name, :middle_name

  def initialize(first_name, last_name, middle_name)
    @first_name = first_name
    @last_name = last_name
    @middle_name = middle_name
  end

  def full_name
    [first_name, last_name, middle_name].join(' ')
  end
end

class Driver < Person
  def initialize(first_name, last_name, middle_name, exp)
    super(first_name, last_name, middle_name)
    @exp = exp
  end
end