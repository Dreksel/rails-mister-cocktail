# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'
require 'byebug'

puts "Deleting ings"
Ingredient.destroy_all

buffer = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read

result = JSON.parse(buffer)

result['drinks'].each do |d|
  Ingredient.create(name: d['strIngredient1'])
end

puts "Seeded ings"
# puts "Clearing db"
# Dose.destroy_all
# Cocktail.destroy_all

# puts "Seeding"
# Ingredient.create(name: "lemon", cocktail_id: 1)
# Ingredient.create(name: "ice", cocktail_id: 2)
# Ingredient.create(name: "mint leaves", cocktail_id: 3)

# Cocktail.create(name: 'sex on the beach')
# Cocktail.create(name: 'screwdriver')
# Cocktail.create(name: 'white russian')

Dose.create(description: '5cl', ingredient: Ingredient.first, cocktail: Cocktail.first)
# puts "done!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11"
