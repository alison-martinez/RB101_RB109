age_array = []
(20..200).each do |i|
  age_array << i
end

puts "Give me your name: "
name = gets.chomp

name = "Teddy" if name == ""

puts "#{name} is #{age_array.sample} years old!"
