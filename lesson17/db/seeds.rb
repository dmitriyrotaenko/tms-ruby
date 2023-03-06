# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

BASE_URL = 'https://api.chucknorris.io/jokes'

JSON(HTTP.get("#{BASE_URL}/categories")).each do |category_name|
  category = Category.create(name: category_name)
  10.times do |n|
    Joke.create(
      text: JSON(HTTP.get("#{BASE_URL}/random?category=#{category.name}"))['value'],
      category_id: category.id)
  end
end