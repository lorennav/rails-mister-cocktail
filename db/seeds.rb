require 'open-uri'
require 'json'

Ingredient.delete_all

records = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)

records['drinks'].each do |record|
  Ingredient.create!(name: record['strIngredient1'])
end
