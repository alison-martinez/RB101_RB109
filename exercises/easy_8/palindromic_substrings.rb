def leading_substrings(string)
  new_array = []
  character_array = string.chars
  while character_array.size > 0
    new_array << character_array.flatten.join
    character_array.pop
  end
  new_array.sort
end

def substrings(string)
  new_array = []
  (0..string.size).each do |i|
    new_array << leading_substrings(string[i, string.size])
  end
  new_array.flatten
end

def palindromes(string)
  results = []
  substring_array = substrings(string)
  substring_array.each do |sub|
    results << sub if sub == sub.reverse && sub.length > 1
  end
  results
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]