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
def joinor(array, main_join = ', ', final_join = 'or')
  new_string = array.join(main_join)
  new_string.gsub!(main_join, " #{final_join}") if array.size == 2
  last_element_length = -array.last.to_s.size - 1
  new_string.insert(last_element_length, "#{final_join} ")
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

def computer_defense(brd)
  WINNING_LINES.each do |line|
    compare_line = [brd[line[0]], brd[line[1]], brd[line[2]]]
    if compare_line.count(PLAYER_MARKER) == 2 && compare_line.index(' ')
      move_index = compare_line.index(' ')
      return line[move_index]
    end
  end
  false
end

def computer_offense(brd)
  WINNING_LINES.each do |line|
    compare_line = [brd[line[0]], brd[line[1]], brd[line[2]]]
    if compare_line.count(COMPUTER_MARKER) == 2 && compare_line.index(' ')
      move_index = compare_line.index(' ')
      return line[move_index]
    end
  end
  false
end

# Computer moves offensively, then defensively, then picks 5 if available, then chooses randomly
def computer_move(brd)
  computer_choice = if computer_offense(brd)
                      computer_offense(brd)
                    elsif computer_defense(brd)
                      computer_defense(brd)
                    elsif brd[5] == ' '
                      5
                    else
                      available_moves(brd).sample
                    end
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

def place_piece!(board, current_player)
  user_move(board) if current_player == 1
  computer_move(board) if current_player == 2
end

def alternate_player(current_player)
  current_player == 1 ? 2 : 1
end

def open_game
  prompt("Let's Play Tic-Tac-Toe!")
  prompt("First one to win five games wins the round!\n\n")
  sleep(2)
end

def starting_player
  prompt('Who would you like to go first? (1 = You; 2 = Computer; 3 = Random)')
  order_choice = gets.chomp.to_i
  order_choice == 3 ? [1, 2].sample : order_choice
end

def initialize_board
  board = { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }
  display_board(board)
  board
end

# **** Main Loop ****

loop do
  open_game
  current_player = starting_player

  winners = { 'Player' => 0, 'Computer' => 0 }
  loop do
    board = initialize_board

    loop do
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if winner?(board) || tie?(board)
    end

    if find_winner(board) == 'Player'
      prompt("Congratulations, you're the winner!")
      winners['Player'] += 1
    elsif find_winner(board) == 'Computer'
      prompt('Sorry, the computer won this time.')
      winners['Computer'] += 1
    elsif tie?(board)
      prompt("It's a tie!")
    end

    if winners['Player'] == 5
      prompt("Congratulations! You won this round #{winners['Player']} to #{winners['Computer']}!")
      break
    elsif winners['Computer'] == 5
      prompt("Sorry :( The computer won this round #{winners['Computer']} to #{winners['Player']}!")
      break
    end

    prompt 'Are you ready for the next game? (Y/N)'
    answer = gets.chomp
    break unless answer.downcase == 'y'
  end

  prompt 'Do you want to play another round? (Y/N)'
  answer = gets.chomp
  break unless answer.downcase == 'y'
end

prompt 'Thanks for playing Tic-Tac-Toe!'
