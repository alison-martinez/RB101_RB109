def prompt(string)
  puts "==> #{string}"
end

number_array = []

prompt "Enter the 1st number:"
num1 = gets.chomp.to_i

prompt "Enter the 2nd number:"
num2 = gets.chomp.to_i

prompt "#{num1} + #{num2} = #{num1 + num2}"
prompt "#{num1} - #{num2} = #{num1 - num2}"
prompt "#{num1} * #{num2} = #{num1 * num2}"
prompt "#{num1} / #{num2} = #{num1 / num2}"
prompt "#{num1} % #{num2} = #{num1 % num2}"
prompt "#{num1} ** #{num2} = #{num1 ** num2}"


