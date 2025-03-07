class Game
  attr_accessor :player_score

  def initialize
    @player_score = []
  end

  def check_player_score(name, score)
    if score < 17
      "#{name} has a score of #{score}, continue the game" 
    elsif score >= 17 && score <= 20
      player_score << score
      "#{name} has a score of 17 or above, stop drawing cards"
    elsif score == 21
      "#{name} has blackjack and has won the game!"
    end
  end

  def check_dealer_score(player_name, score)
    if score < player_score.first
      "The Dealer has a score of #{score}, less than #{player_name}'s score, continue the game"
    elsif score > player_score.first && score <= 21
      "The Dealer has a higher score and has won the game!"
    elsif score > player_score.first && score > 21
      "The Dealer has bust so the player has won the game!"
    end
  end
end