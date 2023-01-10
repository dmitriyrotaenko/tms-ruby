# Задача
# Сумма покупок.
# Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара
# (может быть нецелым числом). Пользователь может ввести произвольное кол-во товаров до тех пор,
# пока не введет "стоп" в качестве названия товара. На основе введенных данных требуетеся:
# Заполнить и вывести на экран хеш, ключами которого являются названия товаров,
# а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара.
# Также вывести итоговую сумму за каждый товар.
# Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".


def retrieve_input(msg = nil, validator = nil, error_msg = nil)
  puts msg
  answer = gets.chomp
  return answer if validator.call(answer) == true

  puts error_msg
  retrieve_input(msg, validator, error_msg)
end

def ask_item_name
  retrieve_input('Enter item name. To finish shopping and go to cart, enter \'stop\'',
                 ->(name) { !name.empty? },
                 'Item name cannot be blank.').downcase
end

def ask_item_price
  retrieve_input('Enter price per 1 item.',
                 ->(price) { price.to_f.positive? },
                 'Price cannot be less than or equal to 0.').to_f
end

def ask_item_quantity
  retrieve_input('Enter quantity you want to buy.',
                 ->(quantity) { quantity.to_f.positive? },
                 'Quantity cannot be less than or equal to 0.').to_f
end

def add_to_cart(cart, item, price, quantity)
  if price.nil?
    cart[item.to_s]['quantity'] += quantity
  else
    cart[item.to_s] = { 'price' => price, 'quantity' => quantity }
  end
end

def show_total_per_item(cart)
  cart.each do |item, price_and_quantity|
    puts "#{item}: #{(price_and_quantity['price'] * price_and_quantity['quantity']).round(2)} FUN."
  end
end

def show_total(cart)
  total = 0
  cart.each do |_, price_and_quantity|
    total += price_and_quantity['price'] * price_and_quantity['quantity']
  end
  total.round(2)
end

def init_cart
  cart = {}
  loop do
    item_name = ask_item_name
    if item_name == 'stop'
      puts cart
      show_total_per_item(cart)
      puts "Total price for all items: #{show_total(cart)} FUN."
      break
    end
    item_price, item_quantity = nil
    # If price == nil, it means item is already in the cart. No need to ask for price
    item_price = ask_item_price if cart[item_name.to_s].nil?
    item_quantity = ask_item_quantity
    add_to_cart(cart, item_name, item_price, item_quantity)
  end
end

init_cart
