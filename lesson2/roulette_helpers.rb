SETTINGS = {
  'available_colors' => %w[red black green],
  'initial_balance' => 100,
  'red_win_multiplier' => 2,
  'black_win_multiplier' => 2,
  'green_win_multiplier' => 36,
  'red_chance' => 45,
  'black_chance' => 45,
  'green_chance' => 10
}.freeze

def get_total_percentage
  SETTINGS['red_chance'] + SETTINGS['black_chance'] + SETTINGS['green_chance']
end

def ask_color
  puts 'What\'s your color (red, black, green): '
  color = gets.chomp
  if SETTINGS['available_colors'].include?(color)
    color
  else
    puts 'Must be red, black, or green'
    ask_color
  end
end

def ask_amount(current_balance)
  puts "How much do you want to place? Your balance: #{current_balance}"
  amount = gets.to_i
  if amount <= current_balance
    amount
  else
    puts 'You have insufficient funds.'
    ask_amount(current_balance)
  end
end

def place_bet(player_balance)
  bet_color = ask_color
  bet_amount = ask_amount(player_balance)
  puts "You placed #{bet_amount} on #{bet_color} and..."
  {
    'bet_color' => bet_color,
    'bet_amount' => bet_amount,
    'balance_after' => player_balance - bet_amount
  }
end

def get_spin_result(max_percent = get_total_percentage)
  random_percent = rand(1..max_percent)
  if random_percent <= SETTINGS['red_chance']
    'red'
  elsif random_percent > SETTINGS['red_chance'] && random_percent <= max_percent - SETTINGS['green_chance']
    'black'
  else
    'green'
  end
end
