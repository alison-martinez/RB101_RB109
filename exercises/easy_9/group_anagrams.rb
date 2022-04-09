def is_anagram?(word1, word2)
  word1.chars.each do |char|
    return false unless word2.include?(char)
  end
  true
end


words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

skip_list = []

words.each do |word1|
  next if skip_list.include?(word1)
  result = [word1]
  words.each do |word2|
    next if word1 == word2
    if is_anagram?(word1, word2)
      result << word2 unless result.include?(word2)
    end 
  end
  if result.length > 1
    p result
    result.each {|match| skip_list << match}
  end
end


