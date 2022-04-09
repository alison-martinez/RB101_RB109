require 'pry'
CARD_VALUES = { '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10,
                'jack' => 10, 'queen' => 10, 'king' => 10, 'ace' => [1, 11] }

FULL_DECK = %w[2 2 2 2 3 3 3 3 4 4 4 4 5 5 5 5 6 6 6 6 7 7 7 7 8 8 8 8 9 9 9 9 10 10 10 10 jack jack jack jack
               queen queen queen queen king king king king ace ace ace ace]

TWENTY_ONE = 21

# Calculate the total value of a hand
def calculate_total(hand)
  total = 0
  hand.each { |card| total += CARD_VALUES[card] if card != 'ace' }
  aces = hand.count('ace')
  aces.times do
    total += (total + 11) > 21 ? 1 : 11
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
def busted?(hand)
  calculate_total(hand) > TWENTY_ONE
end

# Returns true if the dealer wins (dealer total > player total and dealer total no more than 21)
def dealer_wins?(p_hand, d_hand)
  dealer_total = calculate_total(d_hand)
  player_total = calculate_total(p_hand)
  (dealer_total > player_total) && (dealer_total <= 21)
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
  prompt("===========================")
  prompt("#{name}'s cards are: #{hand.join(', ')} (Total: #{calculate_total(hand)})")
  prompt("===========================")
end

# Returns true if the game is over, either because the dealer wins, a player busted, or it is a tie at 21
def game_over?(p_hand, d_hand)
  dealer_wins?(p_hand, d_hand) || busted?(p_hand) || busted?(d_hand)
end

# Report the results of who won
def report_results(p_hand, d_hand)
  if busted?(p_hand)
    prompt("Sorry, you busted with a total of #{calculate_total(p_hand)}!")
  elsif dealer_wins?(p_hand, d_hand)
    prompt("Sorry, the dealer won with a total of #{calculate_total(d_hand)} versus your #{calculate_total(p_hand)}.")
  elsif busted?(d_hand)
    prompt('You win!  The dealer busted!')
  elsif calculate_total(p_hand) == calculate_total(d_hand)
    prompt("It's a tie!")
  else
    prompt("You win with a score of #{calculate_total(p_hand)} to the dealer's #{calculate_total(d_hand)} !")
  end
end

# Do you want to play again?
def play_again?
  loop do
    prompt('Do you want to play again (Y/N)?')
    choice = gets.chomp.downcase
    return choice if %w[y n].include?(choice)

    prompt("I'm sorry, that's not a valid choice.  Choose Y or N.")
  end
end

# *** Main Loop ***

prompt('Welcome to Twenty-One!')

loop do
  working_deck = FULL_DECK.shuffle
  player_hand = []
  dealer_hand = []

  starting_hand(player_hand, working_deck)
  starting_hand(dealer_hand, working_deck)
  prompt("Dealer's cards are: #{dealer_hand[0]}, ?")
  show_cards(player_hand, 'Player')

  loop do
    choice = hit_or_stay?
    deal_card(player_hand, working_deck) if choice == 'hit'
    show_cards(player_hand, 'Player') if choice == 'hit'

    break if choice == 'stay' || busted?(player_hand)
  end

  prompt("You chose to stay with a total of #{calculate_total(player_hand)}!") unless busted?(player_hand)

  loop do
    sleep(1)
    show_cards(dealer_hand, 'Dealer')
    break if game_over?(player_hand, dealer_hand) || calculate_total(dealer_hand) >= 17

    deal_card(dealer_hand, working_deck)
  end

  report_results(player_hand, dealer_hand)
  break if play_again? == 'n'

  
end

prompt('Thank you for playing Twenty-One!')

