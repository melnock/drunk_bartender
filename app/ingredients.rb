
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

  # def drunkify_ingredient(arr, bartender)
  #   if bartender.drunk > 4 && bartender.drunk < 10
  #     arr << make_a_sample
  #   elsif self.drunk >= 10
  #     2.times do
  #       arr << make_a_sample
  #     end
  #   else
  #     arr
  #   end
  # end

  # def extra_in(string)
  #   slurred = ['']
  #   drunkenness = 10 - self.drunk
  #
  #     rando = rand(1..drunkenness)
  #     if letter == 's' && rando == 1
  #       letter += 'h'
  #     else
  #       letter
  #     end
  #   end
  #   shlurred.join('') + " Excuse me! I've had a few!"
  # end
  #
  # def burp(string)
  #   drunkenness = 20 - self.drunk
  #   split_string = string.split(' ')
  #   counter = 0
  #   while counter < split_string.length-1
  #     counter += 1
  #     burp = rand(1..drunkenness)
  #     if burp == 1
  #       split_string[counter] << " *burp!*"
  #     elsif burp == drunkenness
  #       split_string[counter] << " *hic!*"
  #     end
  #   end
  #   string = split_string.join(' ')
  #   string
  # end
end
