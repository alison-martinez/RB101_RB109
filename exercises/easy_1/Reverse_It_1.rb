def reverse_sentence(s)
  output = ""
  s.split.reverse.each {|word| output << word + " "} 
  return output.chop
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''