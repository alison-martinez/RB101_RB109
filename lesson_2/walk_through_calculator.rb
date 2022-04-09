# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0 || num == "0"
end

prompt("Welcome to the Calculator! Enter your name:")
name = ''
loop do
  name = gets.chomp
  if name.empty?()
    prompt("Make sure to use a valid name")
  else
    break
  end
end

prompt("Hi, #{name}")
loop do
  num1 = ''
  num2 = ''
  loop do
    prompt("Give me a number: ")
    num1 = gets.chomp
    if valid_number?(num1)
      break
    else
      prompt("Hmmm... that doesn't look like a valid number")
    end
  end

  loop do
    prompt("Give me another number: ")
    num2 = gets.chomp
    if valid_number?(num2)
      break
    else
      prompt("Hmmm... that doesn't look like a valid number")
    end
  end
  puts "What operation do you want to perform? (add, subtract, multiply, or divide: "
  operation = ''
  loop do
    operation = gets.chomp
    if %w(add subtract multiply divide).include?(operation)
      break
    else
      prompt("Must choose add, subtract, multiply, or divide")
    end
  end
  case operation
  when "add" then prompt("#{num1} + #{num2} is #{num1.to_i + num2.to_i}")
  when "subtract" then prompt("#{num1} - #{num2} is #{num1.to_i - num2.to_i}")
  when "multiply" then prompt("#{num1} times #{num2} is #{num1.to_i * num2.to_i}")
  when "divide" then prompt("#{num1} divided by #{num2} is #{num1.to_f / num2.to_f}")
  end
  prompt("Do you want to perform another operation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt("Thank you for using the calculator!")
