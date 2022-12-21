require_relative './roulette_helpers.rb'
# Доработать задание с занятия с рулеткой:
#  - игрок пытается угадать цвет ячейки рулетки, которая выпала
#  - * у игрока на старте есть баланс в 100 монеток и он может делать ставки. победа на красном и черном x2,
#      а на зеленом x36. После каждого раунда выводить игроку его текущий баланс
#  - сделать шансы близкими к реальным (красное и черное 45%, зеленое 10%)

loop do
  puts "Welcome to roulette! Your balance: #{SETTINGS['initial_balance']}\nWant to place a bet? (y/n)"
  next if gets.chomp != 'y'

  player_balance = SETTINGS['initial_balance']
  play(player_balance)
end

def play(balance)
  current_balance = balance
  bet_data = place_bet(current_balance)
  current_balance -= bet_data['bet_amount']
  roulette_color = get_spin_result
  if bet_data['bet_color'] == roulette_color
    win_amount = bet_data['bet_amount'] * SETTINGS["#{roulette_color}_win_multiplier"]
    current_balance += win_amount
    puts "You won #{win_amount}. You balance #{current_balance}."
  else
    puts "You lost, roulette gave #{roulette_color}. Your balance #{current_balance}"
    exit if current_balance == 0
  end
  puts 'Want to place another bet? (y/n)'
  exit if gets.chomp != 'y'
  play(current_balance)
end
