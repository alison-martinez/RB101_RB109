def cleanup(words)
  words.gsub!(/[^A-Za-z]+/, " ")
end

p cleanup("---what's my +*& line?") == ' what s my line '

