
class Cocktail<ActiveRecord::Base
  belongs_to :bartender
  has_many :ingredients, through: :recipes

  @@id = ""

    def initialize (alcohol:)
      super
      @alcohol = :alcohol
      drink_final_form(alcohol)
    end

  def drink_final_form(alcohol)
    if alcohol.include? ("non-alcoholic")
      non_alcoholic(alcohol)
      non_alcoholic_id
    else
      get_list_by_ingredient(alcohol)
      get_random_drink
      get_random_drink_id
    end

    get_cocktail_from_id
    cocktail_info
  end

  def get_list_by_ingredient(alcohol)
    list_by_ingredient = RestClient.get("http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{alcohol}")
    @ingredient_hash = JSON.parse(list_by_ingredient)
  end

  def non_alcoholic(alcohol)
    non_alcoholic_list = RestClient.get('http://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic')
    @non_alcoholic_ingredient = JSON.parse(non_alcoholic_list)
  end

  def non_alcoholic_id
    id_finder = @non_alcoholic_ingredient["drinks"].sample
    @@id = id_finder['idDrink']
  end

  def get_random_drink
    @ingredient_hash["drinks"].sample
  end

  def get_random_drink_id
    @@id = get_random_drink["idDrink"]
  end

  def self.id
    @@id
  end

  def get_cocktail_from_id
    id_cocktail = RestClient.get("http://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{Cocktail.id}")
    id_cocktail_hash = JSON.parse(id_cocktail)
    id_cocktail_hash
  end

  def cocktail_info
    cocktail_info = self.get_cocktail_from_id["drinks"][0]
  end

  def name
    name = cocktail_info["strDrink"]
  end

  def ingredients
    ingredients = []
    counter = 1
    while counter <= 15
      if cocktail_info["strIngredient#{counter}"] && cocktail_info["strIngredient#{counter}"].length > 0
        ingredients << self.cocktail_info["strMeasure#{counter}"].strip + ": " + self.cocktail_info["strIngredient#{counter}"]
        counter += 1
      else
        break
      end
    end
      ingredients << make_a_sample
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
  #
  # def drunkify_ingredient
  #   bartender = self.bartender
  #
  #   if bartender.drunk > 4 && bartender.drunk < 10
  #     self.ingredients << make_a_sample
  #   # elsif bartender.drunk >= 10
  #   #   2.times do
  #   #     self.ingredients << make_a_sample
  #   #   end
  #   else
  #     self.ingredients
  #   end
  # end


end
