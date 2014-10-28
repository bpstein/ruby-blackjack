# Welcome message
puts "Welcome to Blackjack!"

# Build the deck of cards
suits = ['H', 'D', 'C', 'S']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']


deck = suits.product(cards)

# Note: alternative syntax for product is:
# deck = []
# suits.each do |suit|
# 	cards.each do |card|
# 		deck << [suit, card]

deck.shuffle!

# Deal cards
player_cards = []
dealer_cards = []

player_cards << deck.pop
dealer_cards << deck.pop
player_cards << deck.pop
dealer_cards << deck.pop

puts "Player is dealt " + player_cards.to_s
puts "Dealer is dealt " + dealer_cards.to_s


# Assign numerical values to the cards, including J, Q, K, A

# Assign 1 or 11 numerical value to A card

# Player dealt two cards

# Computer dealt two cards

# Player can hit or stay (loop until chooses to stop)

# Computer can hit or stay

# Computer must hit >= 16

# 

# Highest card combination wins, up to a cap of 21

