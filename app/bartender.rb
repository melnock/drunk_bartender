class Bartender<ActiveRecord::Base
has_many :users
has_many :cocktails
has_many :recipes, through: :cocktails

  def make_a_drink(liquor)
    self.drunk +=1
    drink = Cocktail.new(liquor)
    puts "                    (/;
          .--..-(/;
          |    (/;
        __|====/=|__
       (____________)"
    puts "Gimme a sec!"
    puts self.drink_phrases
    drink
  end

  def give_water
    self.drunk -=1
    puts "Hydration Station! Choo! Choo!"
  end

  def give_advice
    if self.drunk < 5
      puts "Reach for the stars!"
    elsif self.drunk < 8
      puts "Nother drink???"
    else
      puts "zzzzzzzzz"
    end
  end

  def drunken
    if self.drunk <5
      puts "I'm fine!"
    elsif self.drunk <8
      puts "I'm a little drunk, but I love you!"
    else
      puts "uuuuuhhhhh......."
    end
  end

  def small_talk
    if self.drunk < 5
      puts "Nice weather, eh?"
    elsif self.drunk < 8
      puts "Nother drink???"
    else
      puts "zzzzzzzzz"
    end
  end

  def tell_a_joke
    joke = RestClient.get("http://api.icndb.com/jokes/random")
    joke_hash = JSON.parse(joke)["value"]["joke"]
    puts joke_hash + " HAHAHAHAHA!!!!"
  end

  def drink_phrases
    phrases = ["One for you, one for me!",
      "Hope you don't mind if I make one of those for myself, too!",
      "That's one of my favorites! I think I'll have one, too!",
      "Classically irresistable! Let's make it two!",
      "I don't have any problems. I drink with my friends. Who are my friends you ask? All my patrons!",
      "You know what's no fun? Drinking alone. So, I will have one with you!"]
    phrases.sample
  end

end
