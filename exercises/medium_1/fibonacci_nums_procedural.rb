#def fibonacci(num)
#  return 1 if num == 1 || num == 2
#  fibonacci(num - 1) + fibonacci(num - 2)
#end

def fibonacci(num)
  seq = [1, 1]
  (2 .. num-1).each {|index| seq[index] = seq[index - 1] + seq[index - 2]}
  seq[num-1]
end




p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501