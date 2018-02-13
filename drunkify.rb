def shlur(string)
  slurred = ['']
  drunkenness = 2
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

def burp(string)
  drunkenness = 10
  split_string = string.split(' ')
  counter = 0
  while counter < split_string.length-1
    counter += 1
    burp = rand(1..drunkenness)
    if burp == 1
      split_string[counter] << " burp!"
    elsif burp == 10
      split_string[counter] << " hic!"
    end
  end
  puts split_string.join(' ')
end

x = shlur("Pour all ingredients directly into highball glass filled with ice. Stir gently. Garnish. Add a dash of Angostura bitters.")
burp(x)
