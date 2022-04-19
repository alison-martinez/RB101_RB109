def square_sum(n)
  (1..n).reduce(:+) ** 2
end

def sum_square(n)
  (1..n).map {|n| n ** 2}.reduce(:+)
end

def sum_square_difference(n)
  square_sum(n) - sum_square(n)
end


p sum_square_difference(3) == 22
p    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150