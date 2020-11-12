require 'json'
require 'open-uri'

puts "Cleaning the database..."
Ingredient.destroy_all

puts "Adding Ingredients..."

result = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
drinks = result['drinks']

drinks.each do |hash|
  hash.each do |key,value|
    Ingredient.create(name: value)
  end
end

puts "done"
