def merge(array1, array2)
  result_array = []
  combined_array = array1 + array2
  combined_array.each do |element|
    added = false
    if result_array.empty? || element <= result_array.first
      result_array.prepend(element)
    elsif element >= result_array.last
      result_array << element
    else
      (0...result_array.size).each do |index|
        if element >= result_array[index] && element <= result_array[index+1]
          result_array.insert(index+1, element) unless added
          added = true
        end
      end
    end
  end
  result_array
end


def merge_sort(array)
  return array if array.length == 1

  array1 = array[0...(array.length / 2)]
  array2 = array[(array.length / 2)...array.length]

  array1 = merge_sort(array1)
  array2 = merge_sort(array2)

  return merge(array1, array2)

end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]