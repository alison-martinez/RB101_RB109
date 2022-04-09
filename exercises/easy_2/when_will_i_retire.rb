puts "What is your name? "
name = gets.chomp

if name.chars.last == "!"
  name.chars.pop
  puts "HELLO #{name.upcase} WHY ARE WE SCREAMING!"
else 
  puts "Hello #{name}"
end

