def bubble_sort!(array)
  loop do
    swap_flag = 0
    (0..array.length-2).each do |index|
      if array[index] > array[index+1] 
        array[index], array[index+1] = array[index+1], array[index]
        swap_flag = 1
      end
    end
    break if swap_flag == 0
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)