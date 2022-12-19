# Прямоугольный треугольник.
# Программа запрашивает у пользователя 3 стороны треугольника и определяет, является ли треугольник прямоугольным
# (используя теорему Пифагора www-formula.ru), равнобедренным (т.е. у него равны любые 2 стороны)  или
# равносторонним (все 3 стороны равны) и выводит результат на экран. Подсказка: чтобы воспользоваться теоремой
# Пифагора, нужно сначала найти самую длинную сторону (гипотенуза) и сравнить ее значение в квадрате с суммой
# квадратов двух остальных сторон. Если все 3 стороны равны, то треугольник равнобедренный и равносторонний,
# но не прямоугольный.

loop do
  puts 'Введите 3 стороны треугольника через пробел (например, 33 2 17):'
  sides = gets.chomp.split(' ').map(&:to_f).sort # восходящая сортировка
  shortest = sides[0]
  mid = sides[1]
  longest = sides[2]
  is_right_angled = longest**2 == (shortest**2 + mid**2)

  puts 'Этот трегольник прямоугольный' if is_right_angled
  puts 'Этот треугольник равнобедренный и равносторонний' if sides.uniq.size == 1
  puts 'Этот треугольник равнобедренный' if sides.uniq.size == 2
end
