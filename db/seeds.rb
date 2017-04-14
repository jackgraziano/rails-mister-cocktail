10.times do
  ingredient = Ingredient.new
  ingredient.name = Faker::Food.ingredient
  ingredient.save
end

10.times do
  cocktail = Cocktail.new
  cocktail.name = Faker::Hipster.words(2).join(" ")
  cocktail.remote_photo_url = Faker::LoremPixel.image("400x400")
  cocktail.save
end


150.times do
  dose = Dose.new
  dose.ingredient_id = (Ingredient.minimum(:id)..Ingredient.maximum(:id)).to_a.sample
  dose.cocktail_id = (Cocktail.minimum(:id)..Cocktail.maximum(:id)).to_a.sample
  dose.description = Faker::Food.measurement
  dose.save
end
