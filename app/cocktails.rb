class Cocktail<ActiveRecord::Base
  belongs_to :bartender
  has_many :ingredients, through: :recipes
  def find_cocktail_hash
    random_cocktail = RestClient.get('http://www.thecocktaildb.com/api/json/v1/1/random.php')
    cocktail_hash = JSON.parse(random_cocktail)
  end
end
