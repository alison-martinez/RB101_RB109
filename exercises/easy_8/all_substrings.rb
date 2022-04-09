def leading_substrings(string)
  new_array = []
  character_array = string.chars
  while character_array.size > 0
    new_array << character_array.flatten.join
    character_array.pop
  end
  p new_array.sort
  new_array.sort
end

def substrings(string)
  new_array = []
  (0..string.size).each do |i|
    new_array << leading_substrings(string[i, string.size])
  end
  new_array.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]