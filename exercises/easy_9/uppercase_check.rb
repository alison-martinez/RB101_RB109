UPPERCASE = ("A".."Z").to_a

def uppercase?(string)
  string.chars.each do |char|
    next unless char =~ /[A-Za-z]/
    return false unless UPPERCASE.include?(char)
  end
  true
end


p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true