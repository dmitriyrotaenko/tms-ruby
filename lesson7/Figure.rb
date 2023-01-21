# Реализуйте иерархию классов Figure, Circle, Square, Rectangle,
# Triangle с методами area() и perimeter(), которые возвращают площадь и периметр фигуры.
# Используйте полиморфизм.

class Figure
  def area; end
  def perimeter; end
end

class Circle < Figure
  PI = Math::PI

  attr_reader :radius

  def initialize(radius)
    @radius = radius
  end

  def area
    puts (PI * radius**2).round(1)
  end

  def perimeter
    puts (2 * PI * radius).round(1)
  end
end

class Square < Figure

  attr_reader :length

  def initialize(length)
    @length = length
  end

  def area
    puts length**2
  end

  def perimeter
    puts length * 4
  end
end

class Rectangle < Square

  attr_reader :height, :length

  def initialize(length, height)
    @height = height
    super(length)
  end

  def area
    puts length * height
  end

  def perimeter
    puts (length + height) * 2
  end
end

class Triangle

  attr_reader :height, :sides

  def initialize(height, *sides)
    @height = height
    @sides = sides
  end

  def area
    puts (sides[0] * height) / 2
  end

  def perimeter
    puts @sides.sum
  end
end




circle_5 = Circle.new(5)
circle_5.area #=>  78.5
circle_5.perimeter #=> 31.4

square_3 = Square.new(3)
square_3.area #=> 9
square_3.perimeter #=> 12

rect_5_7 = Rectangle.new(5, 7)
rect_5_7.area #=> 35
rect_5_7.perimeter #=> 24

triangle = Triangle.new(5, 10, 5, 4)
triangle.area #=> 25
triangle.perimeter #=> 19