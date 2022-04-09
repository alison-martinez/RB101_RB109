def multisum(num)
  sum = 0
  (1..num).each do |i|
    if i % 3 == 0 || i % 5 == 0
      sum += i
    end
  end
  return sum
end





p multisum(5) == 8
p multisum(3) == 3
p multisum(10) == 33
p multisum(1000) == 234168


