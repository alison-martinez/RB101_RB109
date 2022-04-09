require 'pry'

PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]

# Prompts displayed to screen
def prompt(string)
  puts "=> #{string}"
end

# Represent board as a nine-element hash
def display_board(brd)
  system 'clear'
  puts " #{brd[1]} | #{brd[2]} | #{brd[3]} "
  puts '---+---+---'
  puts " #{brd[4]} | #{brd[5]} | #{brd[6]} "
  puts '---+---+---'
  puts " #{brd[7]} | #{brd[8]} | #{brd[9]} "
end

# Obtain input from user and validate
def joinor(array, main_join=', ', final_join='or')
  new_string = ''
  array.each_with_index do |element, index|
    new_string << element.to_s if index == 0
    return new_string << " #{final_join} " + element if index == 1 && array.size == 2
    new_string << main_join + element.to_s if index > 0 && index < array.size - 1
    new_string << main_join + final_join + ' ' + element.to_s if index == array.size - 1
  end 
  new_string
end

def get_input(brd)
  loop do
    prompt("Choose a position to place a piece (#{joinor(available_moves(brd))})")
    choice = gets.chomp.to_i
    available_moves(brd).include?(choice) ? (return choice) : (puts "Sorry, that's not a valid choice.")
  end
end

# Return an array of available moves
def available_moves(brd)
  brd.keys.select { |position| brd[position] == ' ' }
end

# Incorporate user's input into the player's choice
def user_move(brd)
  user_choice = get_input(brd)
  brd[user_choice] = PLAYER_MARKER
  display_board(brd)
end

# Computer samples randomly from available choices
def computer_move(brd)
  computer_choice = available_moves(brd).sample
  brd[computer_choice] = COMPUTER_MARKER
  display_board(brd)
end

# Is there a winner?
def winner?(brd)
  !!find_winner(brd)
end

# Is there a tie?
def tie?(brd)
  available_moves(brd).empty?
end

# Is there a winner, and, if so, who is it?
def find_winner(brd)
  WINNING_LINES.each do |line|
    compare_line = [brd[line[0]], brd[line[1]], brd[line[2]]]
    return 'Player' if compare_line.all?(PLAYER_MARKER)
    return 'Computer' if compare_line.all?(COMPUTER_MARKER)
  end
  nil
end

# **** Main Loop ****

loop do
  prompt("Let's Play Tic-Tac-Toe!\n\n")

  board = { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }
  display_board(board)

  loop do
    user_move(board)
    break if winner?(board) || tie?(board)

    computer_move(board)
    break if winner?(board) || tie?(board)
  end

  if find_winner(board) == 'Player'
    prompt("Congratulations, you're the winner!")
  elsif find_winner(board) == 'Computer'
    prompt('Sorry, the computer won this time.')
  elsif tie?(board)
    prompt("It's a tie!")
  end

  prompt 'Do you want to play again? (Y/N)'
  answer = gets.chomp
  break unless answer.downcase == 'y'
end

prompt 'Thanks for playing Tic-Tac-Toe!'
