def swap(sentence)
  swapped = []
  sentence.split.each do |word|
    first = word[0]
    last = word[word.length - 1]
    word[0] = last
    word[word.length - 1] = first
    swapped << word
  end
  swapped.join(" ")
end


p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

