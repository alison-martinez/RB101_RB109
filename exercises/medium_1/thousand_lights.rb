def lights_on(num_switches)
  result_array = []
  switches = Array.new(num_switches, 1)
  (2..num_switches).each do |round|
    counter = round-1
    while counter <= num_switches
      switches[counter] == 1 ? (switches[counter] = 0) : (switches[counter] = 1)
      counter += round
    end
  end
  switches.each_with_index do |value, index|
    result_array << (index + 1) if value == 1
  end
  result_array
end


p lights_on(5) == [1, 4]
p lights_on(10) == [1, 4, 9]
p lights_on(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]


