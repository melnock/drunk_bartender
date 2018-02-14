require "io/console"
require "colorized_string"
  class CLI

  def welcome(barkeep)
    pid = fork{ exec 'afplay', 'media/08EdithPiaf-NonJeNeRegretteRien-1960.mp3'}
    welcome_image
    puts "We are really friendly here. We need your name and age to begin.".colorize(:green)
    puts "Name:".colorize(:green)
    name_in = gets.chomp
    puts "Age:".colorize(:green)
    age_in = gets.chomp
    patron = User.create(name: name_in, age: age_in)
    if age_in.to_i < 21
      puts "You are too young drink any alcohol.".colorize(:red)
      welcome(barkeep)
    else
      choice(barkeep, patron)
    end
  end

  def welcome_image
    # puts out a welcome message here!
    puts "_______________________________________________________________________________
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
--------~~~~~~~Lester                                         AMC~~~~~~~--------".colorize(:red)
    puts "                            Welcome to the Baloon Bar".colorize(:red)
  end



  def choice(barkeep, patron)

    loop do

       puts "Hi, #{patron.name}. My name is #{barkeep.name}. What can I help you with?".colorize(:light_blue)
      input = gets.chomp.downcase

      if ["drink", "beer", "wine", "water", "soda", "liquor", "wasted", "alcohol", "to get drunk"].any?{|el| input.include?(el)}
        order_a_drink(barkeep)
      elsif input.include?("joke")
        barkeep.tell_a_joke
      elsif input.include?("advice")
        barkeep.give_advice
      elsif input == "exit"
        pid = fork{ exec 'killall', "afplay" }
        break
      elsif input.include?("weather")
        barkeep.small_talk
      elsif input.include?("drunk")
        barkeep.drunken
      else
        puts "We can't do that here. Ask me for a joke or some advice or a drink! Whenever you want to leave: type 'exit'".colorize(:red)
      end
      continue
    end
  end

  def continue
    sleep 2
    puts "       _
      /\\`--.
     |o-|   )>=====o
      \\/.--'".colorize(:yellow)
    puts "Press any key to ring the bell.".colorize(:green)
    STDIN.getch
    system("say" "-v Pipe Organ" "Ding Dong Ding")
    print "            \r" # extra space to overwrite in case next sentence is short
    system 'clear'
    sleep 1
  end

  def order_a_drink(barkeep)
      puts "What kind of liquor would you like to drink?".colorize(:light_blue)
      input = gets.chomp.downcase

      if input.include? "gin"
        make_drink_info("gin", barkeep)
        puts "#{Ascii.rand_art}"
        puts "If at first you don’t succeed, try, try a gin.".colorize(:green)
      elsif input.include? "vodka"
        make_drink_info("vodka", barkeep)
        puts"#{Ascii.rand_art}"
        puts "Huh. Vodka."
      elsif input.include? "beer"
        make_drink_info("beer", barkeep)
        puts "#{Ascii.rand_art}"
        puts "I used to drink all brands of beer. Now, I am older Budweiser!".colorize(:green)
      elsif input.include? "whiskey"
        make_drink_info("whiskey", barkeep)
        puts "#{Ascii.rand_art}"
        puts "Love makes the world go round? Not at all. Whiskey makes it go round twice as fast. ― Compton Mackenzie".colorize(:green)
      elsif input.include? "bourbon"
        make_drink_info("bourbon", barkeep)
        puts "#{Ascii.rand_art}"
        puts "Coffee by day. Bourbon by night.".colorize(:green)
      elsif input.include? "tequila"
        make_drink_info("tequila", barkeep)
        puts "#{Ascii.rand_art}"
        puts "How do you get a computer drunk? A Screenshot of Tequila.".colorize(:green)
      elsif input.include? "rum"
        make_drink_info("rum", barkeep)
        puts "#{Ascii.rand_art}"
         puts "Rum is never the answer... But it does make you forget the question.".colorize(:green)
       elsif input.include? "mezcal"
         make_drink_info("mezcal", barkeep)
         puts "♪♫♬smoooooke on the waaaaater!♬♪♫".colorize(:green)
         puts barkeep.drink_phrases
      elsif input.include?("non-alcoholic")
        make_drink_info("non-alcoholic", barkeep)
        puts "Fruit juice! Soda! Sobriety!"
      elsif input.include?("wine")
        puts "IIII'm tiiiiiiireeeeeeddddd!!! I waaaaaant to gooo hoooommmme!!! Ugghhhhhh!".colorize(:green)
      elsif input == "water"
        barkeep.give_water
        puts "Hydration Station! Choo! Choo!!".colorize(:green)
      else
        puts "We don't have that drink here...".colorize(:red)
      end

      barkeep.tip
  end

  def make_drink_info(drink, barkeep)
    drink_info = barkeep.make_a_drink(alcohol: drink)
    drink_next = drink_info.ingredients
    puts "This is #{drink_info.name}: made with..."+ drink_next.join(", ").colorize(:purple)
  end
end
