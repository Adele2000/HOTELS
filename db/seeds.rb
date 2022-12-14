# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'faker'

Hotel.destroy_all
User.destroy_all

puts "destroy finished"

user1 = User.create!(email: "adele@gmail.com", password: "wagon2022", password_confirmation: "wagon2022", username: "Adele")
puts "user finished"

file_acacias = URI.open('https://res.cloudinary.com/drnoyqnck/image/upload/v1663706771/LHotel_Particulier-Arles-Aussenansicht-2-376081_tgdswl.jpg')
file_hotel = URI.open('https://res.cloudinary.com/drnoyqnck/image/upload/v1663706768/021258595295-web_sdyyfr.jpg')

acacias = Hotel.create(name: "Hotel Les Acacias", address: "Arles", price: 85, description: "Situé à Arles, à 300 mètres de l'amphithéâtre de la ville, l'Brit Hotel Acacias bénéficie d'une terrasse et d'une vue sur la ville. Doté d'un bar, cet hôtel 3 étoiles entièrement climatisé propose une connexion Wi-Fi gratuite.", room_type: 2, user: user1)
acacias.photo.attach(io: file_acacias, filename: 'arles.jpg', content_type: 'image/jpg')
acacias.save

hotel = Hotel.create!(name: "Hotel du Nord", address: "Paris", price: 83, description: "Situé à Paris, doté d'un bar, cet hôtel 3 étoiles entièrement climatisé propose une connexion Wi-Fi gratuite.", room_type: 1,  user: user1)
hotel.photo.attach(io: file_hotel, filename: 'hotel.jpg', content_type: 'image/jpg')
hotel.save
