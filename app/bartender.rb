class Bartender<ActiveRecord::Base
has_many :users
has_many :cocktails
has_many :recipes, through: :cocktails



  def make_a_drink(liquor)
    self.drunk +=1
    drink = Cocktail.create(liquor)
    drink.bartender_id = self.id
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
    puts drunkify_text("Hydration Station! Choo! Choo!")
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
      puts drunkify_text("I'm a little drunk, but I love you!")
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
    puts drunkify_text(joke_hash + " HAHAHAHAHA!!!!")
  end

  def drink_phrases
    phrases = ["One for you, one for me!",
      "Hope you don't mind if I make one of those for myself, too!",
      "That's one of my favorites! I think I'll have one, too!",
      "Classically irresistable! Let's make it two!",
      "I don't have any problems. I drink with my friends. Who are my friends you ask? All my patrons!",
      "You know what's no fun? Drinking alone. So, I will have one with you!"]
    drunkify_text(phrases.sample)
  end



  def drunkify_text(string)
    if self.drunk > 4 && self.drunk < 10
      shlurred = shlur(string)
      burp(shlurred)
    elsif self.drunk >= 10
      string = string.split(' ').shuffle.join(' ')
      self.drunk = 9
      shlurred = shlur(string)
      burp(shlurred)
    else
      string
    end
  end

  def shlur(string)
    slurred = ['']
    drunkenness = 10 - self.drunk
    split_by_letter = string.split('')
    shlurred = split_by_letter.map do |letter|
      rando = rand(1..drunkenness)
      if letter == 's' && rando == 1
        letter += 'h'
      else
        letter
      end
    end
    shlurred.join('') + " Excuse me! I've had a few!"
  end

  def burp(string)
    drunkenness = 20 - self.drunk
    split_string = string.split(' ')
    counter = 0
    while counter < split_string.length-1
      counter += 1
      burp = rand(1..drunkenness)
      if burp == 1
        split_string[counter] << " *burp!*"
      elsif burp == drunkenness
        split_string[counter] << " *hic!*"
      end
    end
    string = split_string.join(' ')
    string
  end


  # x = drunkify_text("Pour all ingredients directly into highball glass filled with ice. Stir gently. Garnish. Add a dash of Angostura bitters.", 5)
  # %x( say #{x} )
  # return x


end
