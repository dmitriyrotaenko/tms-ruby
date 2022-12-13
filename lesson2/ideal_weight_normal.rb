loop do
  puts 'Как вас зовут?'
  input_name = gets.chomp
  name = input_name.empty? ? 'Таинственный незнакомец' : input_name
  puts 'Введите ваш рост в см:'
  input_height = gets.chomp.to_i
  ideal_weight = (input_height - 110) * 1.15
  puts ideal_weight.positive? ? "#{name}, Ваш идеальный вес: #{ideal_weight} кг." : 'Ваш вес уже оптимальный!'
end