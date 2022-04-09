def interleave(array1, array2)
  array1.zip(array2).flatten
  #new_array = []
  #array1.each_index do |index|
  #  new_array << array1[index]
  #  new_array << array2[index]
  #end
  #new_array
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']