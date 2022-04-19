def valid?(array)
  max = array.max
  sum = 0
  array.each_with_index do |e, index|
    sum += e unless index == array.length - 1
  end
  sum > max
end

def triangle(side1, side2, side3)
  sorted_array = [side1, side2, side3].sort
  return :invalid unless valid?(sorted_array)
  if side1 == side2 && side2 == side3
    return :equilateral
  elsif sorted_array[1] == sorted_array[2]
    return :isosceles
  else
    return :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid