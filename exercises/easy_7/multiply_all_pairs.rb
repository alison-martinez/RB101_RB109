def multiply_all_pairs(array1, array2)
  new_array = []
  array1.each do |a|
    array2.each do |b|
      new_array << a * b
    end
  end
  new_array.sort    
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]