def prompt(string)
  puts "==> #{string}"
end


prompt "Please write a word or multiple words:"
string = gets.chomp
char_num = string.gsub(/\s/, "").length

prompt "There are #{char_num} characters in \"#{string}\"."






