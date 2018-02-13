def drunkify(string, how_drunk)
  if how_drunk > 4
    x = shlur(string, how_drunk)
    burp(x, how_drunk)
  else
    puts string
  end
end


def shlur(string, how_drunk)
  slurred = ['']
  drunkenness = 10 - how_drunk
  split_by_letter = string.split('')
  x = split_by_letter.map do |letter|
    rando = rand(1..drunkenness)
    if letter == 's' && rando == 1
      letter += 'h'
    else
      letter
    end
  end
  x.join('')
end

def burp(string, how_drunk)
  drunkenness = 20 - how_drunk
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
  puts split_string.join(' ')
end

drunkify("Pour all ingredients directly into highball glass filled with ice. Stir gently. Garnish. Add a dash of Angostura bitters.", 9)
