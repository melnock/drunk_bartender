class Ingredients

  def find_drink_ingredients_hash
    drink_ingredients = RestClient.get('http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list')
    drink_ingredients_hash = JSON.parse(drink_ingredients)
  end


  def find_food_ingredients_hash
    food_ingredients = RestClient.get('http://www.themeafindldb.com/api/json/v1/1/list.php?i=list')
    food_ingredients_hash = JSON.parse(food_ingredients)
  end



end
