require "io/console"
  class CLI



  def welcome
    # puts out a welcome message here!
    puts "Welcome to the Bar"
  end

  def make_drink_info(drink, barkeep)
    drink_info = barkeep.make_a_drink(alcohol: drink)
    puts "This is #{drink_info.name}: made with..."+drink_info.ingredients.join(", ")
  end

  def choice(barkeep)
    loop do
      puts "                    (/;
            .--..-(/;
            |    (/;
          __|====/=|__
         (____________)"
      puts"         ᕦ༼   ◔ ͜ʖ ◔   ༽ᕤ"
       puts "What can I help you with?"
      input = gets.chomp

      if input.include?("drink")
        order_a_drink(barkeep)
      elsif input.include?("joke")
        system ("say #{barkeep.tell_a_joke}")
      elsif input.include?("advice")
        barkeep.give_advice
      elsif input == "exit"
        break
      elsif input.include?("weather")
        barkeep.small_talk
      elsif input.include?("drunk")
        barkeep.drunken
      else
        puts "We can't do that here."
      end
      continue
      system 'clear'
    end
  end

  def continue
    puts "       _
      /\\`--.
     |o-|   )>=====o
      \\/.--'"
    puts "Press any key to ring the bell."
    STDIN.getch
    puts "ding!"
    print "            \r" # extra space to overwrite in case next sentence is short
  end

  def order_a_drink(barkeep)
      puts "What kind of liquor would you like to drink?"
      input = gets.chomp.downcase

      if input.include? "gin"
        make_drink_info("gin", barkeep)
        puts "If at first you don’t succeed, try, try a gin."
      elsif input.include? "vodka"
        make_drink_info("vodka", barkeep)
        puts"   .
          .
         . .
          ...
       \\~~~~~/
        \\   /
         \\ /
          V
          |
          |
         ---"
        puts "Huh. Vodka."
      elsif input.include? "beer"
        make_drink_info("beer", barkeep)
        puts "            . .
                   .. . *.
            - -_ _-__-0oOo
             _-_ -__ -||||)
                ______||||______
            ~~~~~~~~~~`'"
        puts "I used to drink all brands of beer. Now, I am older Budweiser!"
      elsif input.include? "whiskey"
        make_drink_info("whiskey", barkeep)
        puts "Love makes the world go round? Not at all. Whiskey makes it go round twice as fast. ― Compton Mackenzie"
      elsif input.include? "bourbon"
        make_drink_info("bourbon", barkeep)
        puts "Coffee by day. Bourbon by night."
      elsif input.include? "tequila"
        make_drink_info("tequila", barkeep)
        puts "How do you get a computer drunk? A Screenshot of Tequila."
      elsif input.include? "non-alcoholic"
        puts "Fruit juice! Soda!"
      elsif input == "water"
        barkeep.give_water
        puts "Hydration Station! Choo! Choo!!"
      else
        puts "We don't have that drink here..."
      end
  end

  def get_character_from_user
    puts "What would you like to drink?"
    gets.chomp.downcase
    # use gets to capture the user's input. This method should return that input, downcased.
  end


end
