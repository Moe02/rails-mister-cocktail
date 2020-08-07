require 'open-uri'
require 'json'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

buffer = open(url).read
results = JSON.parse(buffer)["drinks"]

ingredients_array = results.map do |result|
  result["strIngredient1"]
end

puts "Destroying ingredients"
Ingredient.destroy_all

puts "Creating ingredients...."
ingredients_array.each do |ingredient|
  Ingredient.create!(name: ingredient)
end

puts "Created #{Ingredient.count} ingredients!"

#Cocktails

cocktails_array = ["Ancient Mariner", "Bacardi", "Blow my Skull Off", "Blue Hawaii",
"Brass Monkey", "Bumbo", "Bushwacker", "Caribou Lou",
"Cobra's Fang", "Cojito",
"Cremat", "Ancient Mariner", "Bacardi", "Blue Hawaii", "Brass Monkey", "Bumbo",
"Bushwacker","Caribou Lou","Cobra's Fang", "Cojito", "Cremat"]

puts "Destroying Cocktails"
Cocktail.destroy_all

puts "Creating cocktails...."
cocktails_array.each do |cocktail|
  Cocktail.create!(name: cocktail)
end

puts "Created #{Cocktail.count} cocktails!"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
