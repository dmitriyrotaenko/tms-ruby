SETTINGS = {
  'available_colors' => [],
  'initial_balance' => 100,
  'colors_config' => {
    # [chance, multiplier]
    'red' => [45, 2],
    'black' => [45, 2],
    'green' => [10, 36]
  }
}.freeze

def set_available_colors
  SETTINGS['colors_config'].each do |color, _|
    SETTINGS['available_colors'] << color
  end
end

def total_win_chances
  total_win_percentage = 0
  SETTINGS['colors_config'].each_value do |color|
    total_win_percentage += color[0]
  end
  # percentage can't exceed 100
  total_win_percentage if total_win_percentage == 100
end

def ask_color
  colors = SETTINGS['available_colors'].join(', ')
  puts "What's your color: #{colors}: "
  color = gets.chomp
  if SETTINGS['available_colors'].include?(color)
    color
  else
    puts "Must be one of #{colors}"
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
    'bet_amount' => bet_amount
  }
end

def spin(max_percent = total_win_chances)
  random_percent = rand(1..max_percent)
  current_threshold = SETTINGS['colors_config'].values[0][0]
  SETTINGS['colors_config'].each_with_index do |(color, _), idx|
    return color if random_percent <= current_threshold

    current_threshold += SETTINGS['colors_config'].values[idx + 1][0]
  end
end
