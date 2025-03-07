class Card
  attr_accessor :rank, :suit

  NON_NUMBERED_CARD_VALUES = {
      "Jack"  => 10,
      "Queen" => 10,
      "King"  => 10,
      "Ace"   => 11
    }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value
    return rank if rank.is_a?(Integer)

    NON_NUMBERED_CARD_VALUES[rank]
  end
end