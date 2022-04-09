# VALID_CHOICES = ['rock', 'paper', 'scissors']
VALID_CHOICES = %w(rock paper scissors Spock lizard)

def prompt(message)
  puts "=> #{message}"
end

def find_match(choice)
  VALID_CHOICES.each { |word| return word if word.start_with?(choice) }
end

def win?(player1, player2)
  (player1 == "rock" && player2 == "scissors") ||
    (player1 == "paper" && player2 == "rock") ||
    (player1 == "scissors" && player2 == "paper") ||
    (player1 == "rock" && player2 == "lizard") ||
    (player1 == "lizard" && player2 == "Spock") ||
    (player1 == "Spock" && player2 == "scissors") ||
    (player1 == "scissors" && player2 == "lizard") ||
    (player1 == "lizard" && player2 == "paper") ||
    (player1 == "paper" && player2 == "Spock") ||
    (player1 == "Spock" && player2 == "rock")
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif player == computer
    prompt("It's a tie!")
  else
    prompt("Sorry, computer won.")
  end
end

loop do
  winners = {}
  winners["player1"] = 0
  winners["computer"] = 0

  loop do
    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = gets.chomp
      choice = find_match(choice)
      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("Invalid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    puts "You chose: #{choice}; Computer chose #{computer_choice}"

    display_results(choice, computer_choice)

    if win?(choice, computer_choice)
      winners["player1"] += 1
    elsif win?(computer_choice, choice)
      winners["computer"] += 1
    end

    if winners["player1"] == 3
      prompt("You're the winner of the match!")
      break
    elsif winners["computer"] == 3
      prompt("Sorry, the computer won the match this time.")
      break
    end
  end
  prompt("Do you want to play again (Y/N)")
  break unless gets.chomp.downcase.start_with?("y")
end

prompt "Thank you for playing!  Goodbye!"
