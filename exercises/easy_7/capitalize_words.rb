def word_cap(string)
  word_array = string.split
  word_array.each {|word| word.capitalize!}
  word_array.join(" ")
  
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'