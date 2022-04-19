def star_line(int, line)
  my_line = Array.new(int, ' ')
  mid_line = (int / 2.0).round
  base_index = [mid_line - 2, mid_line]
  if line == mid_line
    my_line = Array.new(int, '*')
  else
    my_line[mid_line-1] = '*'
    base_index.each do |b|
      offset = (line - mid_line).abs
      b < mid_line ? (my_line[b-offset+1] = "*") : (my_line[b+offset-1] = "*")
    end
  end
  my_line.join
end

def star(int)
  (1..int).each do |i|
    puts star_line(int, i)
  end
end

star(7)