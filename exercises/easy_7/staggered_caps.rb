UPPERCASE = ("A".."Z").to_a
LOWERCASE = ("a".."z").to_a

def staggered_case(string)
  counter = 0
  new_string = ""
  string.chars.each do |char|
    if counter.even?
      new_string << char.upcase
    else
      new_string << char.downcase
    end
    counter += 1
  end
  new_string
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'