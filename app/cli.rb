
require "highline/import"
  def welcome
    # puts out a welcome message here!
    puts "Welcome to the Bar"
  end

  def choice
    loop do
      puts "What would you like to drink?"
      input = gets.chomp
      if input.downcase == "gin"

        puts "If at first you don’t succeed, try, try a gin."
      elsif input.downcase == "vodka"
        puts "Huh. Vodka."
      elsif input.downcase == "beer"
        puts "I used to drink all brands of beer. Now, I am older Budweiser!"
      elsif input.downcase == "whiskey"
        puts "Love makes the world go round? Not at all. Whiskey makes it go round twice as fast. ― Compton Mackenzie"
      elsif input.downcase == "bourbon"
        puts "Coffee by day. Bourbon by night."
      elsif input.downcase == "tequila"
        puts "How do you get a computer drunk? A Screenshot of Tequila."
      elsif input.downcase == "non-alcoholic"
        puts "Fruit juice! Soda!"
      elsif input.downcase == "water"
        puts "Hydration Station! Choo! Choo!!"
      elsif input.downcase == "exit"
        break
      else
        puts "We don't have that drink here..."
      end
    end
  end

  def get_character_from_user
    puts "What would you like to drink?"
    gets.chomp.downcase
    # use gets to capture the user's input. This method should return that input, downcased.
  end

  welcome
  choice
