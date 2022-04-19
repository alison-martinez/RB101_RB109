def balanced?(string)
  return false unless string.count("(") == string.count(")")
  return true if string.count("(") == 0
  first_left = string.index("(")
  first_right = string.index(")")
  return false if first_right < first_left
  last_left = string.reverse.index("(")
  last_right = string.reverse.index(")")
  return false if last_left < last_right
  true
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false