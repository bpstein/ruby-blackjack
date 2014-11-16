# Calculate total value of cards held
def calculate_total(cards) 
  # [['H', '3'], ['C', '2'], ... ]
  arr = cards.map{|e| e[1]}

  total = 0
  arr.each do |value|
  	if value == "A"
  		total += 11
  	elsif value.to_i == 0 # i.e. J, Q or K
  		total = total + 10
  	else
  		total += value.to_i
  	end
  end

  # Correct for Aces
  arr.select{|e| e == "A"}.count.times do
  	total -= 10 if total > 21
  end

  total
end

# Welcome message
puts "Welcome to the Blackjack table! What's your name?"
puts ""
name = gets.chomp

# End message
puts "Dealing cards..."
puts ""

# Build the deck of cards
suits = ['H', 'D', 'C', 'S']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']


deck = suits.product(cards)
game_deck = deck * 4

# Note: alternative syntax for product is:
# deck = []
# suits.each do |suit|
#   cards.each do |card|
#     deck << [suit, card]

game_deck.shuffle!

	# Deal cards
	player_cards = []
	dealer_cards = []

	player_cards << game_deck.pop
	dealer_cards << game_deck.pop
	player_cards << game_deck.pop
	dealer_cards << game_deck.pop

	# Variables to calculate total value of cards
	player_total = calculate_total(player_cards)
	dealer_total = calculate_total(dealer_cards)

	# Show cards
	puts "Dealer is dealt #{dealer_cards[0]} and #{dealer_cards[1]}; total: #{dealer_total}"
	puts "#{name} is dealt #{player_cards[0]} and #{player_cards[1]}; total: #{player_total}"
	puts ""

	# Player turn
	if player_total == 21
		puts "Congratulations #{name}, you hit Blackjack! You win!"
		exit
	end

	while player_total < 21
		puts "What would you like to do, #{name}? 1) hit 2) stay"
		hit_or_stay = gets.chomp

		if !['1', '2'].include?(hit_or_stay)
			puts "Error: you must enter either 1 or 2."
			next
		end

		# If user chooses to stay
		if hit_or_stay == "2"
			puts "You chose to stay."
			break
		end

		# If user chooses to hit
		new_card = deck.pop
		puts "Dealing card to player: #{new_card}"
		player_cards << new_card
		player_total = calculate_total(player_cards)
		puts "Your total is now #{player_total}"

		# Outcome at the end of the player's turn
		if player_total == 21
			puts "Congratulations! You hit Blackjack! You win!"
			exit
		elsif player_total > 21 
			puts "Sorry, it looks like you busted!"
			exit
		end
	end

	# Dealer turn

	if dealer_total == 21
		puts "Sorry, the dealer hit Blackjack. You lose!"
		exit
	end

	while dealer_total < 17
		# Dealer hit
		new_card = deck.pop
		puts "Dealing new card for dealer: #{new_card}"
		dealer_cards << new_card
		dealer_total = calculate_total(dealer_cards)
		puts "Dealer total is now: #{dealer_total}"

		if dealer_total == 21
			puts "Sorry #{name}, the dealer hit Blackjack. You lose!"
			exit
		elsif dealer_total > 21
			puts "Congratulations, dealer busted. #{name} wins!"
			exit
		end
	end

	# Compare hands
	puts "Dealer's cards: "
	dealer_cards.each do |card|
		puts "=> #{card}"
	end
	puts ""

	puts "Your cards: "
	player_cards.each do |card|
		puts "=> #{card}"
	end
	puts ""

	if dealer_total > player_total
		puts "Sorry #{name}, the dealer wins"
	elsif dealer_total < player_total
		puts "Congratulations #{name}, you win!"
	else 
		puts "It's a tie..."
	end

	exit
