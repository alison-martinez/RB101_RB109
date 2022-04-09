def leading_substrings(string)
  new_array = []
  character_array = string.chars
  while character_array.size > 0
    new_array << character_array.flatten.join
    character_array.pop
  end
  new_array.sort
end



p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
