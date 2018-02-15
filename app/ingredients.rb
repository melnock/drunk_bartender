
class Ingredient<ActiveRecord::Base
  has_many :cocktails

  def find_drink_ingredients_hash
    drink_ingredients = RestClient.get('http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list')
    drink_ingredients_hash = JSON.parse(drink_ingredients)
  end


  def find_food_ingredients_hash
    food_ingredients = RestClient.get('http://www.themealdb.com/api/json/v1/1/list.php?i=list')
    food_ingredients_hash = JSON.parse(food_ingredients)
  end

  def make_food_array
    arr = find_food_ingredients_hash["meals"].map{|food| food["strIngredient1"]}
    arr
  end

  def make_a_sample
    ingredients_array = ["1 cup : ", "1 squirt : ", "2 tbsp : ", "pinch of: ", "3 dollops: ", "1/2 shot: ", "3/4 lb: ", "8 squeezes of: ", "5/16 tsp: "]
    sample = ingredients_array.sample + make_food_array.sample
  end

end
