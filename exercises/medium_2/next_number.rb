def featured(num)
  loop do 
    num = num +1
    return "Error: No possible number" if num.to_s.length > 10
    next unless num.odd?
    next unless num % 7 == 0
    next unless num.to_s.split('').uniq == num.to_s.split('')
    return num
  end
end


p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements