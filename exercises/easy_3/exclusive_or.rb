def xor?(condition_1, condition_2)
  if condition_1 == condition_2
    return false
  else
    return true
  end
end


p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false






