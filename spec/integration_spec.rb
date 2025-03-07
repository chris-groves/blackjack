RSpec.describe "Full Game" do
  let(:suits)  { %w[Clubs Diamonds Hearts Spades] }
  let(:values) { [2,3,4,5,6,7,8,9,10,"J","Q","K","A"] }
  let(:deck)   { Deck.new(suits, values) }
  let(:game)   { Game.new }
  let(:player_hand) { Hand.new("Sam") }
  let(:dealer_hand) { Hand.new("The Dealer") }

  describe "Full Game Flow" do
    context "Sam is the winner" do
      it "declares the correct result" do
        deck.shuffle
        player_hand.receive_card(Card.new(8, "Hearts"))
        player_hand.receive_card(Card.new(9, "Diamonds"))
        game.check_player_score(player_hand.player_name, player_hand.score)
        dealer_hand.receive_card(Card.new(10, "Hearts"))
        dealer_hand.receive_card(Card.new(5, "Hearts"))
        dealer_hand.receive_card(Card.new(10, "Spades"))
        message = "The Dealer has bust so the player has won the game!"
        expect(game.check_dealer_score(player_hand.player_name, dealer_hand.score)).to eq message
      end
    end

    context "The Dealer is the winner" do
      it "declares the correct result" do
        deck.shuffle
        player_hand.receive_card(Card.new(8, "Hearts"))
        player_hand.receive_card(Card.new(9, "Diamonds"))
        game.check_player_score("Sam", player_hand.score)
        dealer_hand.receive_card(Card.new(10, "Hearts"))
        dealer_hand.receive_card(Card.new(10, "Spades"))
        message = "The Dealer has a higher score and has won the game!"
        expect(game.check_dealer_score(player_hand.player_name, dealer_hand.score)).to eq message
      end
    end
  end

end