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

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]