require 'card'
require 'pry'

RSpec.describe Card do
  describe "#value" do
    it "returns the correct value when a number" do
      rank = 3
      suit = "Hearts"
      card = Card.new(rank, suit)
      expect(card.value).to eq 3
    end

    it "returns the correct value when a face card" do
      rank = "Jack"
      suit = "Spades"
      card = Card.new(rank, suit)
      expect(card.value).to eq 10
    end

    it "returns the correct value when an ace" do
      rank = "Ace"
      suit = "Diamonds"
      card = Card.new(rank, suit)
      expect(card.value).to eq 11
    end
  end
end