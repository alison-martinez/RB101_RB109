DIGIT_HASH = { 1 => "1", 2 => "2", 3 => "3", 4 => "4", 5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9", 0 => "0" }

def integer_to_string(int)
  array = []
  int.digits.reverse.each do |i|
    array << i
  end
  array.join
end


p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

