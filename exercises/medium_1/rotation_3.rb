def rotate_array(array)
  new_array = array.clone
  first_element = new_array.shift
  new_array << first_element
  new_array
end

def rotate_rightmost_digits(num, digits)
  num_array = num.digits.reverse
  rotated_digits = rotate_array(num_array[-digits..-1])
  num_array = num_array[0..(-digits-1)] + rotated_digits
  num_array.join.to_i
end

def max_rotation(num)
  counter = num.digits.length
  while counter > 1
    num = rotate_rightmost_digits(num, counter)
    counter -= 1
  end
  num
end


p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845


