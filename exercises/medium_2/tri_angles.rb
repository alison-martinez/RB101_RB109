def valid?(array)
  return false if array.include?(0)
  return false unless array.reduce(:+) == 180
  true
end

def triangle(angle1, angle2, angle3)
  array = [angle1, angle2, angle3]
  return :invalid unless valid?(array)
  if array.include?(90)
    :right
  elsif array.all? {|a| a < 90}
    :acute
  else
    :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid