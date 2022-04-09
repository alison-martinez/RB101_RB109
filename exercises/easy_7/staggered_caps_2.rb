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
    counter += 1 if char =~ /[A-Za-z]/
    
  end
  new_string
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'