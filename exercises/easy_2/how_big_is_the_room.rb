puts "Enter the length of the room in meters: "
length = gets.chomp.to_f

puts "Enter the width of the room in meters: "
width = gets.chomp.to_f

area_in_m = length * width
area_in_ft = area_in_m * 10.7639

puts "The area of the room is #{area_in_m.round(1)} square meters (#{area_in_ft.round(2)} square feet)."