def repeater(string)
  new_array = string.chars.each.map {|char| char * 2 }
  new_array.join
end


p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''