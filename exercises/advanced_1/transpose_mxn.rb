def transpose(array)
  
  new_columns = array.length
  new_rows = array[0].length
  new_array = Array.new(new_rows) { Array.new }

  (0..(new_columns-1)).each do |row|
    (0..(new_rows - 1)).each do |column|
      new_array[column] << array[row][column]
    end
  end
  new_array
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]