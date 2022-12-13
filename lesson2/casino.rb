colors = %w[ч к з]

loop do
  puts 'Выбери! Черное или красное? (ч/к/з)'
  answer = gets.strip
  rand = colors.sample
  if rand == answer
    puts "Вы выиграли Рулетка выдала #{rand}"
  else
    puts "Вы проиграли. Рулетка выдала #{rand}"
  end
end