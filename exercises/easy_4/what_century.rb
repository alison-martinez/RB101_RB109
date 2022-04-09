def suffix(num)
  if num.chars.last == "1" && num.chars.last(2) != ["1", "1"] 
    "st"
  elsif num.chars.last == "2" && num.chars.last(2) != ["1", "2"] 
    "nd"
  elsif num.chars.last == "3" && num.chars.last(2) != ["1", "3"] 
    "rd"
  else
    "th"
  end
end


def century(year)
  if year.digits.first == 0
    cen = year / 100
  else
    cen = (year / 100) + 1
  end
  cen.to_s << suffix(cen.to_s)

end


p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'


