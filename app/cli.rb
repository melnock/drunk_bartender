require "io/console"
require "colorized_string"
  class CLI

  def intro
    system 'clear'
    puts"     ,---.     .--.  ,-.    .---.   .---.  .-. .-.  ,---.     .--.  ,---.
     | .-.\\   / /\\ \\ | |   / .-. ) / .-. ) |  \\| |  | .-.\\   / /\\ \\ | .-.\\
     | |-' \\ / /__\\ \\| |   | | |(_)| | |(_)|   | |  | |-' \\ / /__\\ \\| `-'/
     | |--. \\|  __  || |   | | | | | | | | | |\\  |  | |--. \\|  __  ||   (
     | |`-' /| |  |)|| `--.\\ `-' / \\ `-' / | | |)|  | |`-' /| |  |)|| |\\ \\
     /( `--' |_|  (_)|( __.')---'   )---'  /(  (_)  /( `--' |_|  (_)|_| \\)\\
    (__)             (_)   (_)     (_)    (__)     (__)                 (__) ".magenta

  puts "Just a neighborhood bar for those who like unique drinks and to never drink alone!".green

  puts "                         ◦
          ○                                                        ◦
                .                     ○      ◦   .         ○
               . .            ◦                 . .
                ...     ◦               ◌        ...      ◦
             \\~~~~~/        .  ○         .   \\~~~~~/              ○          ◌
              \\   /    ◌                      \\   /     ◦               ◌
       ◦   ○   \\ /        .. . *.   ◦     ◌    \\ /    .   .. . *.   .
        |___|   V     -_ _-__-0oOo      =     ◦  V        _-__-0oOo     )(    =
   __QQ |{} |   |    _-_ -__ -||||)    / \\   .   |  \\ /   -__ -||||) . |__|  / \\
~~(_)_\">| {}|   |       ______||||____|xxx|      |   Y   ______||||____|  | |RUM|
──┴──┴  |___|  ---   ~~~~~~~~~`'\",    |___|     --- _|_ ~~~~~~~`'\",    |__| |___|
                                                                                   ".green

    sleep 4
  end

  def welcome(barkeep)
    intro
    system 'clear'
    pid = fork{ exec 'afplay', 'media/Bolero_64kb.wav'}

    welcome_image
    puts "We are really friendly here. We need your name and age to begin.".colorize(:green)
    puts "Name:".colorize(:light_blue)
    name_in = gets.chomp
    puts "Age:".colorize(:light_blue)
    age_in = gets.chomp
    patron = User.create(name: name_in, age: age_in)
    if age_in.to_i < 21
      puts "You are too young drink any alcohol.".colorize(:red).blink
      sleep 2
      welcome(barkeep)
    else
      choice(barkeep, patron)
      sleep 1
      system 'clear'
    end

  end

  def welcome_image
    # puts out a welcome message here!
    Ascii.baloon_bar_entrance
    puts "                            Welcome to the Baloon Bar".colorize(:red)
  end



  def choice(barkeep, patron)

    loop do
      Ascii.select_frame(0)
       puts "Hi, #{patron.name}. My name is #{barkeep.name}. What can I help you with?".colorize(:light_blue)
      input = gets.chomp.downcase

      if barkeep.drunk >= 11
        puts "Your bartender is too drunk. Time to go hoooommmme!"
        sleep 3
        pid = fork{ exec 'killall', "afplay" }
        break
      elsif input.include? "how many"
        number = barkeep.drunk - 4
        puts "You've had:".blue
        puts Ascii.numbers[number].blink.red
        puts "drinks.".blue
      elsif ["drink", "beer", "wine", "water", "soda", "liquor", "wasted", "alcohol", "to get drunk"].any?{|el| input.include?(el)}
        order_a_drink(barkeep)
        system 'clear'
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
    puts "       _
      /\\`--.
     |o-|   )>=====o
      \\/.--'".colorize(:yellow)
    puts "Press any key to ring the bell.".colorize(:green)
    STDIN.getch
    system("say -v fred Ding Dong Ding")
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
      elsif ["non-alcoholic", "soda", "juice", "virgin"].any?{|el| input.include?(el)}
        make_drink_info("non-alcoholic", barkeep)
        barkeep.drunk -=1
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
      sleep 2
      system 'clear'
  end

  def make_drink_info(drink, barkeep)
    drink_info = barkeep.make_a_drink(alcohol: drink)
    drink_next = drink_info.ingredients
    system 'clear'
    Ascii.select_frame(0)
    puts "This is #{drink_info.name}: made with..."+ drink_next.join(", ").colorize(:purple)
  end
end
