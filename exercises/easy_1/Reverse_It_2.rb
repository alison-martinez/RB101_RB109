def reverse_words(s)
  output = ""
  s.split.each do |word| 
    if word.length >= 5
      output << word.split('').reverse.join + " "
    else  
      output << word + " "
    end 
  end
  return output.chop
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS