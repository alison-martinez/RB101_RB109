

def print_in_box(string)
  box_size = string.length + 2
  border_line = "+" + ("-" * box_size) + "+"
  middle_line = "|" + (" " * box_size) + "|"
  text_line = "|" + (" #{string} ") + "|"


  puts border_line
  puts middle_line
  puts text_line
  puts middle_line
  puts border_line
end



print_in_box('To boldly go where no one has gone before.')


