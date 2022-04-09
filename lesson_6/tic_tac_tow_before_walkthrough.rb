# Prompts displayed to screen
def prompt(string)
  puts "=> #{string}"
end

# Represent board as a three-element array, each element being a three element array
def display_board(array)
  system "clear"
  puts '  1 2 3'
  array.each_with_index do |row, index|
    puts "#{index + 1} " + row.join('|')
    if index != array.size - 1
      puts '  -+-+-'
    else
      puts "\n"
    end
  end
end

# Determine whether a row/column choice is valid
def valid_choice?(choice)
  [1, 2, 3].include?(choice)
end

# Obtain input from user and validate
def get_input(type)
  loop do
    prompt("Please choose a #{type} number (1, 2, or 3):")
    choice = gets.chomp.to_i
    valid_choice?(choice) ? (return choice) : (puts "Sorry, that's not a valid choice.")
  end
end

def user_choice(board)
  loop do
    prompt('To choose your move, you will select a row and a column number.')

    user_row = get_input('row')
    user_column = get_input('column')

    if board[user_row - 1][user_column - 1] == ' '
      board[user_row - 1][user_column - 1] = 'X'
      display_board(board)
      break
    else
      prompt('Sorry, that spot is already taken.  Please try again.')
    end
  end
end

# Computer samples randomly from row and column choices
def computer_choice(board)
  loop do
    computer_row = [1, 2, 3].sample
    computer_column = [1, 2, 3].sample
    if board[computer_row - 1][computer_column - 1] == ' '
      board[computer_row - 1][computer_column - 1] = 'O'
      prompt('The computer has made a move.')
      display_board(board)
      break
    end
  end
end

# Returns winner based on checking each row, or false if there is no row winner
def row_winner(board)
  board.each do |row|
    return 'X' if row.all?('X')
    return 'O' if row.all?('O')
  end
  false
end

# Returns winner based on checking each column, or false if there is no column winner
def column_winner(board)
  columns = []
  (0..2).each do |index|
    (0..2).each do |index2|
      columns[index2].nil? ? (columns[index2] = [board[index2][index]]) : (columns[index2] << [board[index2][index]])
    end
  end
  columns.each do |column|
    return 'X' if column.all?('X')
    return 'O' if column.all?('O')
  end
  false
end

# Returns winner based on checking each diagonal, or false if there is no diagonal winner
def diag_winner(board)
  diags = []
  diags[0] = [board[0][0], board[1][1], board[2][2]]
  diags[1] = [board[0][2], board[1][1], board[2][0]]
  diags.each do |diag|
    return 'X' if diag.all?('X')
    return 'O' if diag.all?('O')
  end
  false
end

# Checks all possible configurations to see if there is a winner.  Returns winner, tie, or false if no winner or tie
def winner?(board)
  return row_winner(board) if row_winner(board)
  return column_winner(board) if column_winner(board)
  return diag_winner(board) if diag_winner(board)
  return 'T' if board.flatten.count(' ').zero?

  false
end

# **** Main Loop ****

loop do
  prompt("Let's Play Tic-Tac-Toe!\n\n")

  board = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  display_board(board)

  loop do
    user_choice(board)
    break if winner?(board)

    computer_choice(board)
    break if winner?(board)
  end

  if winner?(board) == 'X'
    prompt("Congratulations, you're the winner!")
  elsif winner?(board) == 'O'
    prompt('Sorry, the computer won this time.')
  elsif winner?(board) == 'T'
    prompt("It's a tie!")
  end

  prompt 'Do you want to play again? (Y/N)'
  answer = gets.chomp
  break unless answer.downcase == 'y'
end

prompt 'Thanks for playing Tic-Tac-Toe!'
