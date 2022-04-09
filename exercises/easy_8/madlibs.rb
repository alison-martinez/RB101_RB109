def prompt(string)
  puts "=> #{string}"
end

def get_input(word_type)
  prompt "Enter a #{word_type}:"
  input = gets.chomp
  return input
end

noun = get_input("noun")
verb = get_input("verb")
adjective = get_input("adjective")
adverb = get_input("adverb")

prompt("Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!")

