def stringy(int)
string = ""
int.times do |i|
  if string[i-1] == nil || string[i-1] == "0"
    string << "1"
  elsif string[i-1] == "1"
    string << "0"
  end
end
return string
end  
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'