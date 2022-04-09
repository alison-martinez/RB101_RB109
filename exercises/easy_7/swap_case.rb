UPPERCASE = ("A".."Z").to_a
LOWERCASE = ("a".."z").to_a

def swapcase(string)
  new_string = ""
  string.chars.each do |char|
    if UPPERCASE.include?(char)
      new_string << char.downcase
    elsif LOWERCASE.include?(char)
      new_string << char.upcase
    else
      new_string << char
    end
  end
  new_string
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'