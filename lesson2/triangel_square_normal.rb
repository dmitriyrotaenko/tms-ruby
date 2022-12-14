loop do
  puts 'Введите основание треугольника в см:'
  base = gets.chomp.to_i
  puts 'Введите высоту треуголника в см:'
  # приведение к числу с точкой на случай, если введут число с точкой
  height = gets.chomp.to_f
  square = (base * height) / 2
  puts "Площадь треугольника равна #{square}"
end