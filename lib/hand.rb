class Hand
  attr_accessor :player_name, :cards
  
  def initialize(name)
    @player_name = name
    @cards = []
  end

  def receive_card(card)
    cards << card
  end

  def score
    cards.map do |card|
      card.value
    end.sum
  end
end