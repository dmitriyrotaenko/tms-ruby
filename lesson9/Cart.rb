require 'faker'

# 1) Создать класс Товар, имеющий переменные имя, цена, рейтинг.
# 2) Создать класс Категория, имеющий переменные имя и массив товаров. Создать несколько объектов класса Категория
# .Cоздать класс Basket, содержащий массив купленных товаров.
# 4) Создать класс User, содержащий логин, пароль и объект класса Basket. Создать несколько объектов класса User
# 5) Вывести на консоль каталог продуктов.
# 6) Вывести на консоль покупки посетителей магазина.

module Printable
  def print(data)
    data.each { |item| puts item.name }
  end
end

class Product

  attr_reader :name, :price, :rating

  def initialize(name, price, rating)
    @name = name
    @price = price
    @rating = rating
  end
end

class Category

  attr_reader :name, :products

  def initialize(name, products = [])
    @name = name
    @products = products
  end
end

class Cart

  attr_reader :products

  def initialize(products = [])
    @products = products
  end
end

class User
  include Printable

  attr_reader :login, :cart

  def initialize(login, password, cart)
    @login = login
    @password = password
    @cart = cart
  end
end

cart_1 = []
cart_2 = []

10.times do |num|
  product = Product.new(Faker::Commerce.product_name, rand(0..100), rand(1..10.0).round(1))
  if num.even?
    cart_1 << product
  else
    cart_2 << product
  end
end

user_1 = User.new(Faker::Internet.email, Faker::Internet.password, Cart.new(cart_1))
user_2 = User.new(Faker::Internet.email, Faker::Internet.password, Cart.new(cart_2))

user_1.print(user_1.cart.products)
user_2.print(user_2.cart.products)

