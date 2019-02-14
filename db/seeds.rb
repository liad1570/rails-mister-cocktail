require 'open-uri'
require 'json'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 puts "I am destroying all cocktails"
Dose.destroy_all
Cocktail.destroy_all
 Ingredient.destroy_all
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")





# Go fetch the contents of a URL & store them as a String
response = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read

# "Pretty prints" the result to look like a web page instead of one long string of HTML
 data = JSON.parse(response)
 data =  data["drinks"]
  data.each do |d|
  	 d["strIngredient1"]
  	Ingredient.create(name:d["strIngredient1"] )
  	 
 
  end

