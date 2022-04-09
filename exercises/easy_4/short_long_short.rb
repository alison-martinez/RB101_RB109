def short_long_short(string1, string2)
  if string1.size > string2.size
    return string2 + string1 + string2
  else
    return string1 + string2 + string1
  end
end



  p short_long_short('abc', 'defgh') == "abcdefghabc"
  p short_long_short('abcde', 'fgh') == "fghabcdefgh"
  p short_long_short('', 'xyz') == "xyz"


