# Квадратное уравнение. Пользователь вводит 3 коэффициента a, b и с. Программа вычисляет дискриминант (D) и корни уравнения (x1 и x2, если они есть) и выводит значения дискриминанта и корней на экран. При этом возможны следующие варианты:
# Если D > 0, то выводим дискриминант и 2 корня
# Если D = 0, то выводим дискриминант и 1 корень (т.к. корни в этом случае равны)
# Если D < 0, то выводим дискриминант и сообщение "Корней нет"
# Подсказка: Алгоритм решения с блок-схемой (www.bolshoyvopros.ru). Для вычисления квадратного корня, нужно использовать

loop do
  puts "Введите 3 коэффициента числа (a, b, c) по которым хотите вычислить дискриминант. \n" \
       'Числа разделяйте пробелом, например (5 11 3):'
  user_input = gets.chomp.split(' ').map(&:to_f)
  a = user_input[0]
  if a == 0
    puts "'a' не может быть нулём \nВыход из программы..."
    exit
  end
  b = user_input[1]
  c = user_input[2]

  discriminant = b**2 - 4 * a * c

  if discriminant > 0
    x1 = (-b + Math.sqrt(discriminant)) / 2 * a
    x2 = (-b + Math.sqrt(discriminant)) / 2 * a
    puts "Дескриминант: #{discriminant} \n Первый корень: #{x1} \n Второй корень: #{x2}"
  elsif discriminant == 0
    x = -b / (2 * a)
    puts "Дескриминант: #{discriminant} \n Корни: #{x}"
  else
    puts "Дескриминант: #{discriminant} \n Корней нет."
  end
end
