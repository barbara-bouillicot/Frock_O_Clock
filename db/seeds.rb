# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning up database..."
Booking.destroy_all
Costume.destroy_all
User.destroy_all


user = User.create!(
  first_name:"Peter",
  last_name:"Piper",
  email:"peter@piper.com",
  password:"123456",
  location:"somewhere, USA"
)

costume = Costume.create!(
  name:"Zelda",
  category:"videogame",
  size:"XXXXL",
  material:"rubber",
  description:"rubber suit of the princess",
  price:"12.99",
  user_id:User.first.id)

  booking = Booking.create!(
  start_date: Date.parse("09/01/2009"),
  end_date: Date.parse("09/01/2009"),
  price:"10.99",
  total:"15.99",
  user_id:User.first.id,
  costume_id:Costume.first.id
  )
