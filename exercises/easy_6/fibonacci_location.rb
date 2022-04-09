fibonacci_sequence = [1, 1]

def find_fibonacci_index_by_length(int)
  first_num = 1
  second_num = 1
  counter = 3
  loop do
    first_num, second_num = second_num, first_num + second_num
    return counter if second_num.digits.length >= int
    counter += 1
  end

end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847