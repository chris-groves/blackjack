class Deck
  attr_accessor :suits, :values, :cards

  def initialize(suits, values)
    @suits = suits
    @values = values
    @cards = create_deck
  end

  def create_deck
    values.product(suits).map do |suit, value|
      Card.new(suit,value)
    end
  end

  def shuffle
    cards.shuffle!
  end

  def draw_card
    cards.shift
  end
end