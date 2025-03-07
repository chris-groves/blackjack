require 'game'

RSpec.describe Game do
  let(:game) { Game.new }
  let(:player_name) { "Sam"}

  describe "#check_player_score" do
    context "when the score is less than 17" do
      it "tells the game to continue" do
        score = 15
        expect(game.check_player_score(player_name,score)).to eq "#{player_name} has a score of #{score}, continue the game"
      end
    end

    context "when the score is between 17 and 20 inclusive" do
      it "tells the game to continue" do
        score = 18
        expect(game.check_player_score(player_name, score)).to eq "#{player_name} has a score of 17 or above, stop drawing cards"
      end
    end

    context "when the score is 21" do
      it "announces the winner" do
        score = 21
        expect(game.check_player_score(player_name, score)).to eq "#{player_name} has blackjack and has won the game!"
      end
    end
  end

  describe "#check_dealer_score" do
  let(:player_score) { 17 }
   
    context "when the score is less than the player's score" do
      it "tells the game to continue" do
        dealer_score = 14
        message = "The Dealer has a score of #{dealer_score}, less than #{player_name}'s score, continue the game"
        game.check_player_score(player_name, player_score)
        expect(game.check_dealer_score(player_name, dealer_score)).to eq message
      end
    end

    context "when the score is greater than the player's score" do
      context "when the score is 21 or less" do
        it "announces the dealer has won the game" do
          dealer_score = 18
          message = "The Dealer has a higher score and has won the game!"
          game.check_player_score(player_name, player_score)
          expect(game.check_dealer_score(player_name, dealer_score)).to eq message
        end
      end
      
      context "when the score is greater than 21" do
        it "announces the player has won the game" do
          dealer_score = 22
          message = "The Dealer has bust so the player has won the game!"
          game.check_player_score(player_name, player_score)
          expect(game.check_dealer_score(player_name, dealer_score)).to eq message
        end
      end
    end
  end
end