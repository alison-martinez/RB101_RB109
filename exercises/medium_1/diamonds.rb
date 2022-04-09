def diamond(odd_int)
  1.step(odd_int, 2) do |i|
    padding = (odd_int - i) / 2
    puts (" " * padding) + ("*" * i) + (" " * padding)
  end
  (odd_int-2).step(1, -2) do |i|
    padding = (odd_int - i) / 2
    puts (" " * padding) + ("*" * i) + (" " * padding)
  end

end


diamond(9)
diamond(3)
