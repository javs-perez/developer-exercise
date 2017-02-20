require "rails_helper"

RSpec.describe Blackjack::Hand do
  it "calculates the value correctly" do
    deck = Blackjack::Deck.new
    hand = Blackjack::Hand.new
    2.times { hand.hit!(deck) }

    expect(hand.value).to be >= 4
  end

  describe "#play_as_dealer" do
    it "should stop above 16" do
      deck = Blackjack::Deck.new
      hand = Blackjack::Hand.new
      2.times { hand.hit!(deck) }
      hand.play_as_dealer(deck)

      expect(hand.value).to be >= 16
    end
  end
end
