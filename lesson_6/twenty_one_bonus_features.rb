require 'pry'
CARD_VALUES = { '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10,
                'jack' => 10, 'queen' => 10, 'king' => 10, 'ace' => [1, 11] }

FULL_DECK = %w[2 2 2 2 3 3 3 3 4 4 4 4 5 5 5 5 6 6 6 6 7 7 7 7 8 8 8 8 9 9 9 9 10 10 10 10 jack jack jack jack
               queen queen queen queen king king king king ace ace ace ace]

TWENTY_ONE = 21
DEALER_HIT_LIMIT = 17

# Calculate the total value of a hand
def calculate_total(hand)
  total = 0
  hand.each { |card| total += CARD_VALUES[card] if card != 'ace' }
  aces = hand.count('ace')
  aces.times do
    total += (total + 11) > TWENTY_ONE ? 1 : 11
  end
  total
end

# Format output to screen
def prompt(string)
  puts "=> #{string}"
end

# Deal a single card to a hand, and delete that card from the deck so it can't be chosen again
def deal_card(hand, deck)
  card_index = (0..deck.length - 1).to_a.sample
  hand << deck[card_index]
  deck.delete_at(card_index)
end

# Deal the initial hand (2 cards)
def starting_hand(hand, deck)
  2.times { deal_card(hand, deck) }
end

# Returns true if the hand is over 21
def busted?(total)
  total > TWENTY_ONE
end

# Returns true if the dealer wins (dealer total > player total and dealer total no more than 21)
def dealer_wins?(p_total, d_total)
  ((d_total > p_total) && (d_total <= TWENTY_ONE)) || p_total > TWENTY_ONE
end

# Returns true if the dealer wins (dealer total > player total and dealer total no more than 21)
def player_wins?(p_total, d_total)
  ((p_total > d_total) && (p_total <= TWENTY_ONE)) || d_total > TWENTY_ONE
end

# Returns Player or Dealer depending on who won the game (return value for ties is not used)
def who_won?(p_total, d_total)
  return 'Player' if player_wins?(p_total, d_total)
  return 'Dealer' if dealer_wins?(p_total, d_total)
end

# Ask a player if they want to hit or stay and validate that choice
def hit_or_stay?
  loop do
    prompt('Do you want to hit or stay?')
    choice = gets.chomp.downcase
    return choice if %w[hit stay].include?(choice)

    prompt("Sorry, that's not a valid choice.")
  end
end

# Display the current hand of a player or the dealer
def show_cards(hand, name)
  prompt('===========================')
  prompt("#{name}'s cards are: #{hand.join(', ')} (Total: #{calculate_total(hand)})")
  prompt('===========================')
end

# Returns true if the game is over, either because the dealer wins, a player busted, or it is a tie at 21
def game_over?(p_total, d_total)
  dealer_wins?(p_total, d_total) || busted?(p_total) || busted?(d_total)
end

# Report the results of who won
def report_results(p_total, d_total)
  if busted?(p_total)
    prompt("Sorry, you busted with a total of #{p_total}!")
  elsif dealer_wins?(p_total, d_total)
    prompt("Sorry, the dealer won with a total of #{d_total} versus your #{p_total}.")
  elsif busted?(d_total)
    prompt('You win!  The dealer busted!')
  elsif p_total == d_total
    prompt("It's a tie!")
  else
    prompt("You win with a score of #{p_total} to the dealer's #{d_total} !")
  end
end

# Do you want to play again?
def play_again?
  loop do
    prompt('Do you want to play another round (Y/N)?')
    choice = gets.chomp.downcase
    return choice if %w[y n].include?(choice)

    prompt("I'm sorry, that's not a valid choice.  Choose Y or N.")
  end
end

# Do you want to play again?
def ready?
  loop do
    prompt('Are you ready for the next hand (Y/N)?')
    choice = gets.chomp.downcase
    return choice if %w[y n].include?(choice)

    prompt("I'm sorry, that's not a valid choice.  Choose Y or N.")
  end
end

# *** Main Loop ***

prompt('Welcome to Twenty-One!')
wins = Hash.new(0)

# Loop for each Round
loop do
  prompt('First one to win five hands wins the round!')
  wins['Player'] = 0
  wins['Dealer'] = 0
  # Loop for each hand
  loop do
    working_deck = FULL_DECK.shuffle
    player_hand = []
    dealer_hand = []

    starting_hand(player_hand, working_deck)
    starting_hand(dealer_hand, working_deck)
    player_total = calculate_total(player_hand)
    dealer_total = calculate_total(dealer_hand)

    prompt("Dealer's cards are: #{dealer_hand[0]}, ?")
    show_cards(player_hand, 'Player')

    # Player's Turn
    loop do
      choice = hit_or_stay?
      deal_card(player_hand, working_deck) if choice == 'hit'
      player_total = calculate_total(player_hand)
      show_cards(player_hand, 'Player') if choice == 'hit'

      break if choice == 'stay' || busted?(player_total)
    end

    prompt("You chose to stay with a total of #{player_total}!") unless busted?(player_total)

    # Dealer's turn
    loop do
      break if busted?(player_total)

      sleep(1)
      show_cards(dealer_hand, 'Dealer')
      break if game_over?(player_total, dealer_total) || dealer_total >= DEALER_HIT_LIMIT

      deal_card(dealer_hand, working_deck)
      dealer_total = calculate_total(dealer_hand)
    end

    # Report outcome and tally results
    report_results(player_total, dealer_total)
    winner = who_won?(player_total, dealer_total)
    wins[winner] += 1 unless player_total == dealer_total
    prompt("Current score: Player #{wins['Player']} vs Dealer #{wins['Dealer']}")

    break if wins['Player'] == 5 || wins['Dealer'] == 5 || ready? == 'n'
  end
  if wins['Player'] == 5
    puts 'Congratulations!  You won the round!'
  elsif wins['Dealer'] == 5
    puts 'The dealer won this round.  Better luck next time!'
  end

  break if play_again? == 'n'
end
prompt('Thank you for playing Twenty-One!')
