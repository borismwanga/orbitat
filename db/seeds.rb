# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'


# user

125.times {
    rand = SecureRandom.alphanumeric
    User.create(first_name: Faker::Name.first_name  , last_name: Faker::Name.last_name , email:Faker::Internet.email, phone_number:Faker::PhoneNumber.cell_phone, space_driving_license: rand, password:"123456",)
}

25.times{
    capacity = rand(10000)
    randCategroy = ('A'..'E').to_a.sample
    speed = [true, false].sample
    user = (5..45).to_a.sample
    sp = Spaceship.create(name:Faker::Movies::StarWars.vehicle, category: randCategroy, location: Faker::Movies::StarWars.planet ,price:Faker::Number.between(from: 200.0, to: 10000.0) ,description: Faker::Movies::StarWars.quote, speed_of_light: speed, capacity: capacity, fuel_drive: Faker::Science.element_state, brand: Faker::Space.company, user_id: user)
}
