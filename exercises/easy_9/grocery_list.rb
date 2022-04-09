def buy_fruit(hash)
  result = []
  hash.each do |key, value|
    value.times { result << key }
  end
  result

end


p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]