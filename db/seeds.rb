# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.create(
  first_name:"Peter",
  last_name:"Piper",
  email:"peter@piper.com",
  password:"123456",
  location:"somewhere, USA"
)

costume = Costume.create(
  name:"Zelda",
  category:"videogame",
  size:"XXXXL",
  material:"rubber",
  description:"rubber suit of the princess",
  price:"12.99",
  user_id:1)


