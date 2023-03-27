# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



10.times do |n|
  customer = Customer.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    title: Faker::DcComics.hero,
    visits: rand(100),
    orders_count: 0
  )

  order = Order.create(
    status: rand(0..2),
    subtotal: rand(1..100.0),
    shipping: rand(1..20.0),
    tax: rand(1..15.0),
    total: rand(100..1000.0),
    customer_id: customer.id
  )

  author = Author.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    title: Faker::Drone.name
  )

  supplier = Supplier.create(
    name: Faker::Book.publisher
  )

  book = Book.create(
    title: Faker::Book.title,
    year_published: rand(1950..2023),
    isbn: 0,
    price: rand(1..100.0),
    out_of_print: [true, false].sample,
    views: rand(5000),
    supplier_id: supplier.id,
    author_id: author.id
  )

  BookOrder.create(
    book_id: book.id,
    order_id: order.id
  )

  10.times do |n|
    Review.create(
      title: Faker::Book.title,
      body: Faker::Quote.famous_last_words,
      rating: rand(1..5),
      state: rand(1..5),
      customer_id: customer.id,
      book_id: book.id
    )
  end
end