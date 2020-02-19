# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    phone_number: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample.capitalize
  )
  restaurant.save!
  
  (1..3).to_a.sample.times do
    review = Review.new(
      content: Faker::Restaurant.review,
      rating: (1..5).to_a.sample,
      restaurant_id: restaurant.id
    )
    review.save!
  end
end
