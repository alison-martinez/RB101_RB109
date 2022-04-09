def prompt(string)
  puts "==> #{string}"
end

number_array = []

prompt "Enter the 1st number:"
number_array << gets.chomp.to_i

prompt "Enter the 2nd number:"
number_array << gets.chomp.to_i

prompt "Enter the 3rd number:"
number_array << gets.chomp.to_i

prompt "Enter the 4th number:"
number_array << gets.chomp.to_i

prompt "Enter the 5th number:"
number_array << gets.chomp.to_i

prompt "Enter the last number:"
last_num = gets.chomp.to_i

if number_array.include?(last_num)
  puts "The number #{last_num} appears in #{number_array}."
else
  puts "The number #{last_num} does not appear in #{number_array}."
end

