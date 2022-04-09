DIGIT_HASH = { 1 => "1", 2 => "2", 3 => "3", 4 => "4", 5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9", 0 => "0" }

def signed_integer_to_string(int)
  array = []
  if int > 0
    array << "+"
  elsif int < 0
    int *= -1
    array << "-"
  end
  int.digits.reverse.each do |i|
    array << i
  end
  array.join
end


p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

