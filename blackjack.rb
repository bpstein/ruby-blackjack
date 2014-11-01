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
puts "Welcome to Blackjack!"


# End message
puts "Dealing cards..."
puts ""

# Build the deck of cards
suits = ['H', 'D', 'C', 'S']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']


deck = suits.product(cards)

# Note: alternative syntax for product is:
# deck = []
# suits.each do |suit|
#   cards.each do |card|
#     deck << [suit, card]

deck.shuffle!

# Deal cards
player_cards = []
dealer_cards = []

player_cards << deck.pop
dealer_cards << deck.pop
player_cards << deck.pop
dealer_cards << deck.pop

# Variables to calculate total value of cards
player_total = calculate_total(player_cards)
dealer_total = calculate_total(dealer_cards)

# Show cards
puts "Dealer is dealt #{dealer_cards[0]} and #{dealer_cards[1]}; total: dealer_total"
puts "Player is dealt #{player_cards[0]} and #{player_cards[1]}; total: player_total"
puts ""

# Give player option to hit or stay
puts "What would you like to do? 1) hit 2) stay"
hit_or_stay = gets.chomp


# Assign numerical values to the cards, including J, Q, K, A

# Assign 1 or 11 numerical value to A card



# Player can hit or stay (loop until chooses to stop)

# Computer can hit or stay

# Computer must hit >= 16

# 

# Highest card combination wins, up to a cap of 21
