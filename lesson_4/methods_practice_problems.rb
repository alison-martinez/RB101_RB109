# Problem 1
puts "Problem 1"

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flint_hash = {}
flintstones.each_with_index do |value, index|
  flint_hash[value] = index
end

p flint_hash

# Problem 2
puts "Problem 2"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
total_age = 0
ages.each_key {|key| total_age += ages[key]}
p total_age


# Problem 3
puts "Problem 3"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.reject {|key, value| key if value >= 100 }

# Problem 4
puts "Problem 4"
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages.values.min

# Problem 5
puts "Problem 5"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
value = flintstones.index { |element| element[0,2] == "Be" }
p value

# Problem 6
puts "Problem 6"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.map! {|name| name[0,3]}

# Problem 7
puts "Problem 7"
statement = "The Flintstones Rock"
letters = ('A'..'Z').to_a + ('a'..'z').to_a
results = Hash.new(0)
statement.chars.each {|char| results[char] += 1 if letters.include?(char)}
p results

# Problem 9
puts "Problem 9"
words = "the flintstones rock"
array = words.split.map {|word| word.capitalize}
p array.join(" ")

# Problem 10
puts "Problem 10"
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_key do |key|
  age = munsters[key]["age"]
  age_group = case age
              when 0 .. 17 then "kid"
              when 18 .. 64 then "adult"
              else "senior"
              end
  munsters[key]["age_group"] = age_group
end
p munsters




