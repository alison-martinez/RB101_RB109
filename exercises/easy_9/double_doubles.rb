def is_double?(int)
  return false if int.digits.size.odd?
  size = int.digits.size / 2
  #puts "#{size}\t#{int.digits[0, size]}\t#{int.digits[size, size]}"
  return true if int.digits[0, size] == int.digits[size, size]
end

def twice(int)
  is_double?(int) ? int : int * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10