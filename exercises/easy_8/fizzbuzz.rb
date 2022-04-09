def fizzbuzz(int1, int2)
  result = []
  (int1..int2).each do |int|
    if int % 3 == 0 
      if int % 5 == 0
        result << "FizzBuzz"
      else
        result << "Fizz"
      end
    elsif int % 5 == 0
      result << "Buzz"
    else
      result << int
    end
  end
  result.join(", ")
end


p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz