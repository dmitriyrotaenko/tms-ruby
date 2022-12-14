loop do
  puts 'Введите основание треугольника в см:'
  base = gets.chomp.to_i
  puts 'Введите высоту треуголника в см:'
  height = gets.chomp.to_f
  square = (base * height) / 2
  puts "Площадь треугольника равна #{square}"
end