# Николаю требуется проверить, возможно ли из представленных отрезков условной длины сформировать
# треугольник. Для этого он решил создать класс TriangleChecker, принимающий только положительные числа.
# С помощью метода is triangle() возвращаются следующие значения (в зависимости от ситуации):
# Ура, можно построить треугольник!;
# С отрицательными числами ничего не выйдет!;
# Нужно вводить только числа!;
# Жаль, но из этого треугольник не сделать.

class TriangleChecker
  REQUIRED_NUMBER_OF_SIDES = 3

  def initialize(sides)
    if sides.size == REQUIRED_NUMBER_OF_SIDES
      @sides = sides
    else
      puts 'Треугольник можно построить только с тремя сторонами.'
      exit
    end
  end

  def all_numbers?(err_msg = 'Нужно вводить только числа!')
    if @sides.all?(Numeric)
      true
    else
      puts err_msg
      false
    end
  end

  def all_positive?(err_msg = 'С отрицательными числами ничего не выйдет!')
    if @sides.all?(&:positive?)
      true
    else
      puts err_msg
      false
    end
  end

  def can_draw_triangle?(err_msg = 'Жаль, но из этого треугольник не сделать.')
    sored_sides = @sides.sort
    a = sored_sides[0]
    b = sored_sides[1]
    c = sored_sides[2]

    if (a + b) > c
      puts 'Ура, можно построить треугольник!'
      true
    else
      puts err_msg
      false
    end
  end

  def triangle?
    all_numbers? && all_positive? && can_draw_triangle?
  end

end

valid_triangle = TriangleChecker.new([1, 2, 2])
valid_triangle.triangle? #=> 'Ура, можно построить треугольник!'

invalid_triangle = TriangleChecker.new([1, 2, 3])
invalid_triangle.triangle? #=> Жаль, но из этого треугольник не сделать.
