require 'hand'
require 'card'

RSpec.describe Hand do
  let(:hand) { Hand.new("Sam") }
  describe "#receive_card" do
    it "receives a new card" do
      card = ["card"]
      expect { hand.receive_card(card) }.to change { hand.cards.length }.by(1)
    end
  end

  describe "#score" do
    it "calculates the score of a hand with 1 card" do
      card = Card.new(2,"Hearts")
      hand.receive_card(card)
      allow(card).to receive(:value).and_return(2)
      expect(hand.score).to eq(2)
    end

    it "calculates the score of a hand with 3 cards" do
      card = Card.new(2,"Hearts")
      card_2 = Card.new("J","Spades")
      card_3 = Card.new("A","Spades")
      hand.receive_card(card)
      hand.receive_card(card_2)
      hand.receive_card(card_3)
      allow(card).to receive(:value).and_return(2)
      allow(card_2).to receive(:value).and_return(10)
      allow(card_3).to receive(:value).and_return(11)
      expect(hand.score).to eq(23)
    end
  end
end