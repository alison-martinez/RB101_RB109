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


p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917


