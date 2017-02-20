require "rails_helper"

RSpec.describe Blackjack::Game do
  it "has a players hand" do
    expect(Blackjack::Game.new.player_hand.cards.length).to eq(2)
  end

  it "has a dealers hand" do
    expect(Blackjack::Game.new.dealer_hand.cards.length).to eq(2)
  end

  it "should have a status" do
    expect(Blackjack::Game.new.status).to_not be_nil
  end

  it "hits when told to do so" do
    game = Blackjack::Game.new
    game.hit
    expect(game.player_hand.cards.length).to be >= 2
  end

  it "plays the dealer hand when stand" do
    game = Blackjack::Game.new
    game.stand
    expect(game.status[:winner]).to_not be_nil
  end

  describe "#determine_winner" do
    it "should have dealer win when player busts" do
      expect(Blackjack::Game.new.determine_winner(22, 15)).to eq(:dealer)
    end

    it "should player win if dealer busts" do
      expect(Blackjack::Game.new.determine_winner(18, 22)).to eq(:player)
    end

    it "should have player win if player > dealer" do
      expect(Blackjack::Game.new.determine_winner(18, 16)).to eq(:player)
    end

    it "should have push if tie" do
      expect(Blackjack::Game.new.determine_winner(16, 16)).to eq(:push)
    end
  end
end
