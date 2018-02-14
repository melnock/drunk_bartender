# class Drunkify
#   has_many :bartenders
#
# def drunkify_text(string, how_drunk)
#   if how_drunk > 4 && how_drunk < 10
#     shlurred = shlur(string, how_drunk)
#     burp(shlurred, how_drunk)
#   elsif how_drunk >= 10
#     string = string.split(' ').shuffle.join(' ')
#     shlurred = shlur(string, 9)
#     burp(shlurred, 9)
#   else
#     puts string
#     string
#   end
# end
#
# def shlur(string, how_drunk)
#   slurred = ['']
#   drunkenness = 10 - how_drunk
#   split_by_letter = string.split('')
#   shlurred = split_by_letter.map do |letter|
#     rando = rand(1..drunkenness)
#     if letter == 's' && rando == 1
#       letter += 'h'
#     else
#       letter
#     end
#   end
#   shlurred.join('')
# end
#
# def burp(string, how_drunk)
#   drunkenness = 20 - how_drunk
#   split_string = string.split(' ')
#   counter = 0
#   while counter < split_string.length-1
#     counter += 1
#     burp = rand(1..drunkenness)
#     if burp == 1
#       split_string[counter] << " burp!"
#     elsif burp == drunkenness
#       split_string[counter] << " hic!"
#     end
#   end
#   string = split_string.join(' ')
#   puts string
#   string
# end
# end
#
# # x = drunkify_text("Pour all ingredients directly into highball glass filled with ice. Stir gently. Garnish. Add a dash of Angostura bitters.", 5)
# # %x( say #{x} )
# # return x
