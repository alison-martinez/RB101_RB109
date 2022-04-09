def double_consonants(string)
  new_array = []
  string.chars.each do |char|
    if char =~ /[BCDFGHJKLMNPQRSTVWXYZbcdfghjklmnpqrstvwxyz]/
      new_array << char * 2
    else
      new_array << char
    end
  end
  new_array.join
end


p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""