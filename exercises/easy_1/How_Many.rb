def count_occurrences(a)
  count = {}
  a.each {|vehicle| count[vehicle] == nil ? (count[vehicle] = 1) : (count[vehicle] += 1)} 
  count.each {|x, y| puts "#{x} => #{y}" }
end  

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)