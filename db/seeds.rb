
10.times do
  url = 'http://www.thecocktaildb.com/api/json/v1/1/random.php'
  obj = JSON.parse(open(url).read)
  @cocktail = Cocktail.new
  @cocktail.name = obj["drinks"][0]["strDrink"]
  @cocktail.remote_photo_url = obj["drinks"][0]["strDrinkThumb"]
  @cocktail.save


  15.times do |index|
    current_ingredient_index = "strIngredient" + (index + 1).to_s
    current_measurement_index = "strMeasure" + (index + 1).to_s
    current_ingredient = obj["drinks"][0][current_ingredient_index]
    current_dose = obj["drinks"][0][current_measurement_index]
    if current_ingredient != ""
      @ingredient = Ingredient.new
      @ingredient.name = current_ingredient
      if @ingredient.save
        @dose = Dose.new
        @dose.ingredient = @ingredient
        @dose.cocktail = @cocktail
        @dose.description = current_dose
        @dose.save
      else
        @dose = Dose.new
        @dose.ingredient = Ingredient.find_by_name(current_ingredient)
        @dose.cocktail = @cocktail
        @dose.description = current_dose
        @dose.save
      end
    end
  end
end

# 10.times do
#   ingredient = Ingredient.new
#   ingredient.name = Faker::Food.ingredient
#   ingredient.save
# end


# 150.times do
#   dose = Dose.new
#   dose.ingredient_id = (Ingredient.minimum(:id)..Ingredient.maximum(:id)).to_a.sample
#   dose.cocktail_id = (Cocktail.minimum(:id)..Cocktail.maximum(:id)).to_a.sample
#   dose.description = Faker::Food.measurement
#   dose.save
# end
