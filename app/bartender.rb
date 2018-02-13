class Bartender<ActiveRecord::Base
has_many :users
has_many :cocktails
has_many :recipes, through: :cocktails

  def make_a_drink(liquor)
    self.drunk +=1
    drink = Cocktail.new(liquor)
    puts "Cheers! Drink up!"
  end

  def give_water
    self.drunk -=1
    puts "Hydration Station! Choo! Choo!"
  end

  def give_advice
    if @drunk < 5
      puts "Nice weather, eh?"
    elsif @drunk < 8
      puts "Nother drink???"
    else
      puts "zzzzzzzzz"
    end
  end

  def small_talk
    if @drunk < 5
      puts "Nice weather, eh?"
    elsif @drunk < 8
      puts "Nother drink???"
    else
      puts "zzzzzzzzz"
    end
  end

  def tell_a_joke
    joke = RestClient.get("http://api.icndb.com/jokes/random")
    joke_hash = JSON.parse(joke)["value"]["joke"]
    puts joke_hash
  end


  



end
