# Problem 1
puts "Problem 1"

arr = ['10', '11', '9', '7', '8']

p arr.sort {|a, b| b.to_i <=> a.to_i}

# Problem 2
puts "\n\nProblem 2"

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by! do |element|
  element[:published]
end

p books

# Problem 3
puts "\n\nProblem 3"

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

puts arr1[2][1][3]
puts arr2[1][:third][0]
puts arr3[2][:third][0][0]
puts hsh1["b"][1]
puts hsh2[:third].keys[0]

# Problem 4
puts "\n\nProblem 4"

arr1 = [1, [2, 3], 4]
arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
hsh1 = {first: [1, 2, [3]]}
hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

arr1[1][1] = 4
p arr1

arr2[2] = 4
p arr2

hsh1[:first][2] = [4]
p hsh1

hsh2[['a']][:a][2] = 4
p hsh2

# Problem 5
puts "\n\nProblem 5"

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age = 0
munsters.each do |key, _value|
  total_age += munsters[key]["age"] if munsters[key]["gender"] == "male"
end
puts total_age

# Problem 6
puts "\n\nProblem 6"

munsters.each_key do |name|
  puts "#{name} is a #{munsters[name]["age"]}-year-old #{munsters[name]["gender"]}."
end

# Problem 7

a = 2
b = [5, 8]
arr = [a, b] # [2, [5,8]]

arr[0] += 2 # [4, [5, 8]]
arr[1][0] -= a # [4, [3, 8]]

# a = 2
# b = [3, 8]

# Problem 8
puts "\n\nProblem 8"

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key, value|
  value.each do |word|
    word.chars.each do |char|
      puts char if "aeiou".include?(char)
    end
  end
end

# Problem 9
puts "\n\nProblem 9"

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

new_array = arr.map do |subarr|
              subarr.sort {|a, b| b <=> a}
            end
p new_array
p arr

# Problem 10
puts "\n\nProblem 10"

array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_array = array.map do |subhash|
              new_subhash = {}
              subhash.each do |k, v|
                new_subhash[k] = v + 1
              end
              new_subhash      
            end

p new_array
p array

# Problem 11
puts "\n\nProblem 11"

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

new_arry =  arr.map do |subarr|
              subarr.select do |e|
                e % 3 == 0
              end
            end

p new_arry
p arr

# Problem 12
puts "\n\nProblem 12"

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

new_hash = {}
arr.each do |element|
  key = element[0] 
  value = element[1] 
  new_hash[key] = value
end

p new_hash

# Problem 13
puts "\n\nProblem 13"

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

new_arr = arr.sort_by do |subarr|
            subarr.select do |element|
              element.odd?
            end
          end

p new_arr

# Problem 14
puts "\n\nProblem 14"

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

result_array = hsh.map do |_key, value|
                if value[:type] == 'fruit'
                  value[:colors].map {|color| color.capitalize}
                else
                  value[:size].upcase
                end
              end

p result_array


# Problem 15
puts "\n\nProblem 15"

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

new_array = arr.select do |hash|
              hash.values.flatten.all? {|element| element.even?}
            end

p new_array

# Problem 16
puts "\n\nProblem16"

require 'securerandom'

UUID_FORMAT = [8, 4, 4, 4, 12]
HEX_SYMBOLS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, "a", "b", "c", "d", "e", "f"]

def uuid()
  result = []
  UUID_FORMAT.each do |i|
    string = ""
    i.times do 
      string << HEX_SYMBOLS.sample.to_s
    end
    result << string
  end
  result.join("-")

end

p uuid()
