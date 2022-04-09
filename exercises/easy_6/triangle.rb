def triangle(value)
  (1..value).each do |i| 
    line = (" " * (value - i)) + ("*" * i)
    puts line
  end
end

triangle(5)

triangle(9)