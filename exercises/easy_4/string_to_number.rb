def string_to_integer(string)
  total = 0
  multiplier = 1
  string.chars.reverse.each do |i|
    case i
    when "1" then total += multiplier * 1
    when "2" then total += multiplier * 2
    when "3" then total += multiplier * 3
    when "4" then total += multiplier * 4
    when "5" then total += multiplier * 5
    when "6" then total += multiplier * 6
    when "7" then total += multiplier * 7
    when "8" then total += multiplier * 8
    when "9" then total += multiplier * 9
    when "0" then total += multiplier * 0
    end
    multiplier *= 10
  end
    total
end



  p string_to_integer('4321') == 4321
  p string_to_integer('570') == 570


