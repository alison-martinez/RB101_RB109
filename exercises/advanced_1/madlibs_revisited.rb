WORDS = { adjective: %w(quick lazy sleepy ugly), 
          noun: %w(fox dog head leg),
          verb: %w(jumps lifts bites licks),
          adverb: %w(easily lazily noisily excitedly)
        }

file_data_lines = File.readlines("./madlibs_file.txt", chomp: true) 

file_data_lines.each do |line|
  word_array = line.split(' ')
  word_array.map! do |word|
    if word[0] != "%"
      word
    else
      word_type = word.gsub(/[^a-z]/, '')
      sub_word = WORDS[word_type.to_sym].sample
      new_word = word.gsub(word_type, sub_word)
      new_word.gsub(/[\%\{\}]/, '')
    end
  end
  puts word_array.join(' ')
end
