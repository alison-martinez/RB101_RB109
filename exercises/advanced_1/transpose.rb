matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

def transpose(array)
  new_array = [[], [], []]
  (0..2).each do |row|
    (0..2).each do |column|
      new_array[row][column] = array[column][row]
    end
  end
  new_array
end

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]