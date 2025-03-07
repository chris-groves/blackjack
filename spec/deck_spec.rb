require 'deck'
require 'card'
require 'pry'

RSpec.describe Deck do
  describe "#create_deck" do
    context "with 1 card" do
      let(:values) { [2] }
      let(:suits) { ["Hearts"] }
      let(:deck)  { Deck.new(suits, values) }

      it "creates a deck with 1 card" do
        expect(deck.create_deck.first).to be_an_instance_of(Card)
        expect(deck.create_deck.length).to eq(1)
      end

      it "creates a deck containing 1 card" do
        expect(deck.create_deck.first).to be_an_instance_of(Card)
      end
    end

    context "with multiple cards" do
      let(:values) { [2,"J"] }
      let(:suits) { %w[Clubs Diamonds Hearts Spades] }
      let(:deck)  { Deck.new(suits, values) }

      it "creates a deck of multiple cards" do
        expect(deck.create_deck.length).to eq(8)
      end

      it "creates a deck containing multiple cards" do
        expect(deck.create_deck.last).to be_an_instance_of(Card)
      end

    end

    context "with a full set of cards" do
      let(:values) { [2,3,4,5,6,7,8,9,10,"J","Q","K","A"] }
      let(:suits) { %w[Clubs Diamonds Hearts Spades] }
      let(:deck)  { Deck.new(suits, values) }

      it "creates a full deck of cards" do
        expect(deck.create_deck.length).to eq(52)
      end

      it "creates a full deck containing cards" do
        expect(deck.create_deck.last).to be_an_instance_of(Card)
      end
    end
  end

  describe "#shuffle" do
    let(:values) { values = [2,"J"] }
    let(:suits) { %w[Clubs Diamonds Hearts Spades] }
    let(:deck) { Deck.new(suits, values) }

    it "changes the order of the cards" do
      shuffled_deck = deck.shuffle
      expect(deck).to_not eq shuffled_deck
    end
  end

  describe "#draw_card" do
    let(:values) { values = [2,"J"] }
    let(:suits) { %w[Clubs Diamonds Hearts Spades] }
    let(:deck) { Deck.new(suits, values) }

    it "draws a card from the top of the deck" do
      card = deck.draw_card
      expect(card.rank).to eq(2)
      expect(card.suit).to eq("Clubs")
    end

    it "draws 1 card from the deck" do
      expect { deck.draw_card }.to change { deck.cards.length }.by(-1)
    end
  end
end

