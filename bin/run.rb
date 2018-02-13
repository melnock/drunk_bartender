require_relative '../config/environment'

i = Cocktail.new

i.get_list_by_ingredient("Vodka")
i.get_random_drink
i.get_random_drink_id
i.get_cocktail_from_id
puts i.cocktail_info
puts "•••••••••••••••••••••••••••••••••••••••••••••••"
puts i.ingredients


Pry.start
