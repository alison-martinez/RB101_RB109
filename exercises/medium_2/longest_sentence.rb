# file_data = File.read("./longest_sentence_input.txt").gsub(/\n/, " ")
file_data_array = File.readlines("./longest_sentence_input.txt", chomp: true)
file_string = file_data_array.join(' ')
array = file_string.split(/[\.\?\!]/)

longest_sentence = ""
array.each do |sentence|
  if sentence.split.length > longest_sentence.split.length
    longest_sentence = sentence
  end
end

# longest_sentence = array.max_by {|sentence| sentence.split.size}

puts longest_sentence.split.size
puts longest_sentence

