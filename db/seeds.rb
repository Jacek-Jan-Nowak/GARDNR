# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

puts "Resetting database"
# Booking.destroy_all
Garden.destroy_all
User.destroy_all

# creating test user
puts 'Creating 1 test user... pass testing'
User.create!(
  first_name: "Test",
  last_name: "Testingson",
  email: "testing@testing.com",
  password: "testing"
)
puts 'TEST users created!'

# creating users
puts 'Creating 10 fake users...'
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "testing"
  )
end
puts 'Fake users created!'

gardens_urls = [
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1628119006/gardens/front-yard-ideas-on-a-budget11-561x842_e2pbsl.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1628119006/gardens/front-yard-ideas-on-a-budget20-561x842_mwaufl.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1628119007/gardens/front-yard-ideas-on-a-budget25-561x842_jlodkn.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1628119006/gardens/front-yard-ideas-on-a-budget10-561x842_camfia.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1628119007/gardens/front-yard-ideas-on-a-budget23-561x842_c1d7lo.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1628119007/gardens/front-yard-ideas-on-a-budget22-561x842_qdmp9i.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1628119006/gardens/front-yard-ideas-on-a-budget18-561x842_u27kuh.jpg"
]

puts 'Creating 10 gardens'
10.times do
  garden = Garden.create!(
    user: User.all.sample,
    title: Faker::Company.catch_phrase, 
    address: Faker::Address.street_address, 
    price: rand(10..140),
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    )
    rand(0..4).times do
      file = URI.open(gardens_urls.sample)
      garden.photos.attach(io: file, filename: 'photo.jpg')
    end
    
    puts 'Gardens created!'
    puts 'ALL DONE!'
end