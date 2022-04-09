def halvsies(array)
  array1_size = (array.size.to_f / 2).ceil
  array[0], array[1] = array.slice(0,array1_size), array.slice(array1_size, array.size - array1_size)
  array.slice(0,2)
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]