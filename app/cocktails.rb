class Cocktail

  # def find_random_id
  #   random_cocktail = RestClient.get('http://www.thecocktaildb.com/api/json/v1/1/random.php')
  #   cocktail_hash = JSON.parse(random_cocktail)
  # end
  #
  # def find_cocktail_hash
  #   id_cocktail = RestClient.get("http://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{random_cocktail_info}")
  #   id_cocktail_hash = JSON.parse(id_cocktail)
  # end
  #
  # def random_cocktail_info
  #   self.find_random_id["drinks"][0]["idDrink"].to_s
  # end
  #
  # def cocktail_info
  #   self.find_cocktail_hash["drinks"][0]
  # end
  #
  # def instructions
  #   self.cocktail_info["strInstructions"]
  # end

  @@id = ""


  def get_list_by_ingredient(alcohol)
    list_by_ingredient = RestClient.get("http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{alcohol}")
    @ingredient_hash = JSON.parse(list_by_ingredient)
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

  #
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
    ingredients
  end



  #   counter = 1
  #   ingredients = []
  #   while  counter <= 15
  #     if self.cocktail_info["strIngredient#{counter}"]
  #       ingredients << self.cocktail_info["strMeasure#{counter}"].strip + ": " + self.cocktail_info["strIngredient#{counter}"]
  #       counter +=1
  #     else
  #       break
  #     end
  #   end
  #   ingredients
  # end

end
