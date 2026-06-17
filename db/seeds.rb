# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Créer des hôtels
hotel1 = Hotel.create!(
  name: "Hôtel Le Mistral",
  city: "Nice",
  description: "Un hôtel élégant au cœur de Nice, proche de la mer.",
  price: 45,
  photo_url: "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800"
)

hotel2 = Hotel.create!(
  name: "Hôtel Bellevue",
  city: "Lyon",
  description: "Hôtel moderne au centre de Lyon avec vue panoramique.",
  price: 39,
  photo_url: "https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=800"
)

hotel3 = Hotel.create!(
  name: "Hôtel Central Park",
  city: "Paris",
  description: "Hôtel de luxe au cœur de Paris, proche des Champs-Élysées.",
  price: 59,
  photo_url: "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800"
)

# Créer des chambres
Room.create!(room_type: "Chambre Simple", price: 45, hotel: hotel1)
Room.create!(room_type: "Chambre Double", price: 75, hotel: hotel1)
Room.create!(room_type: "Suite", price: 120, hotel: hotel1)

Room.create!(room_type: "Chambre Simple", price: 39, hotel: hotel2)
Room.create!(room_type: "Chambre Double", price: 65, hotel: hotel2)

Room.create!(room_type: "Chambre Simple", price: 59, hotel: hotel3)
Room.create!(room_type: "Chambre Double", price: 89, hotel: hotel3)
Room.create!(room_type: "Suite Présidentielle", price: 199, hotel: hotel3)

puts "#{Hotel.count} hôtels créés !"
puts "#{Room.count} chambres créées !"
