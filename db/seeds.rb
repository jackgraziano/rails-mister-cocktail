10.times do
  ingredient = Ingredient.new
  ingredient.name = Faker::Food.ingredient
  ingredient.save
end

10.times do
  cocktail = Cocktail.new
  cocktail.name = Faker::Hipster.words(2).join(" ")
  cocktail.save
end
