# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Faker::Config.locale = 'fr'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

20.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name.downcase}-#{last_name.downcase}@yopmail.com"

  User.create(
    first_name: first_name,
    last_name: last_name,
    email: email
  )
end

50.times do
  Event.create(
    start_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 30),
    duration: 5 * rand(1..24),
    title: Faker::Game.title,
    description: Faker::Quote.most_interesting_man_in_the_world,
    price: rand(1..1000),
    location: Faker::Address.city,
    admin: User.all.sample
  )
end

150.times do
  Attendance.create(
    user: User.all.sample,
    event: Event.all.sample
  )
end
