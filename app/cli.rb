require "io/console"
  class CLI

  def welcome(barkeep)
    puts " Welcome to Baloon Bar.  We are really friendly here. We need your name and age to begin."
    puts "Name:"
    name_in = gets.chomp
    puts "Age:"
    age_in = gets.chomp
    patron = User.create(name: name_in, age: age_in)
    if age_in.to_i < 21
      puts "You are too young drink any alcohol."
      welcome(barkeep)
    else
      choice(barkeep, patron)
    end

  end

  def welcome_image
    # puts out a welcome message here!
    puts "			_______________________________________________________________________________
                          .-|-|----------------|-|-.
                          | .-. .-. .  .-. .-. . . |_
                     .--~~| |-| |-| |  | | | | |\\| | ~~--.
                     |    | `-' ` ' `- `-' `-' ' ' |     |
                     |    `-.____________________.-'     |
_______________      |                                   |
     |         |     |                                   |
  /  |   /  /  |     |                                   |
/    |     /   |     | _______                   _______ |
_____|_________|     ||       ~---_         _---~       ||
     |    /    |     ||           ~---. .---~           ||
 / / |         |     ||               | |               ||
  /  |  /   /  |     ||               | |               ||
_____|_________|     ||               | |               ||
---------------'     ||               |  |               ||
                     ||               | |               ||
                     ||               | |               ||
                     ||           .---' `---.           ||
                     |`.______.---'         `---.______.'|
               ______|                                   |______
--------~~~~~~~Lester                                         AMC~~~~~~~--------"
    puts "                            Welcome to the Baloon Bar"
  end

  def make_drink_info(drink, barkeep)
    drink_info = barkeep.make_a_drink(alcohol: drink)
    puts "This is #{drink_info.name}: made with..."+drink_info.ingredients.join(", ")
  end

  def choice(barkeep, patron)

    loop do
      welcome_image
      puts "                    (/;
            .--..-(/;
            |    (/;
          __|====/=|__
         (____________)"
      puts"         ᕦ༼   ◔ ͜ʖ ◔   ༽ᕤ
-------๑๑๑๑----------๑๑๑๑-------------------------------------|===|---
                                                              |{} |
                                                              | {}|
                                                              |___|
      -)---)---)---)---)---)---)---)---)---)---)---)----)----)----)----)"
       puts "Hi, #{patron.name}. My name is #{barkeep.name}. What can I help you with?"
      input = gets.chomp

      if input.include?("drink")
        order_a_drink(barkeep)
      elsif input.include?("joke")
        barkeep.tell_a_joke
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
    system 'clear'
  end

  def order_a_drink(barkeep)
      puts "What kind of liquor would you like to drink?"
      input = gets.chomp.downcase

      if input.include? "gin"
        make_drink_info("gin", barkeep)
        puts "#{Ascii.rand_art}"
        puts "If at first you don’t succeed, try, try a gin."
      elsif input.include? "vodka"
        make_drink_info("vodka", barkeep)
        puts"#{Ascii.rand_art}"
        puts "Huh. Vodka."
      elsif input.include? "beer"
        make_drink_info("beer", barkeep)
        puts "#{Ascii.rand_art}"
        puts "I used to drink all brands of beer. Now, I am older Budweiser!"
      elsif input.include? "whiskey"
        make_drink_info("whiskey", barkeep)
        puts "#{Ascii.rand_art}"
        puts "Love makes the world go round? Not at all. Whiskey makes it go round twice as fast. ― Compton Mackenzie"
      elsif input.include? "bourbon"
        make_drink_info("bourbon", barkeep)
        puts "#{Ascii.rand_art}"
        puts "Coffee by day. Bourbon by night."
      elsif input.include? "tequila"
        make_drink_info("tequila", barkeep)
        puts "#{Ascii.rand_art}"
        puts "How do you get a computer drunk? A Screenshot of Tequila."
      elsif input.include? "rum"
        make_drink_info("rum", barkeep)
        puts "#{Ascii.rand_art}"
         puts "Rum is never the answer... But it does make you forget the question."
       elsif input.include? "mezcal"
         make_drink_info("mezcal", barkeep)
         puts "♪♫♬smoooooke on the waaaaater!♬♪♫"
         puts barkeep.drink_phrases
      elsif input.include? "non-alcoholic"
        puts "Fruit juice! Soda!"
      elsif input == "water"
        barkeep.give_water
        puts "Hydration Station! Choo! Choo!!"
      else
        puts "We don't have that drink here..."
      end
  end
end
