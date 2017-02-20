require "rails_helper"

RSpec.describe Blackjack::Card do
  it "accepts suit, name and value when building" do
    card = Blackjack::Card.new(:clubs, 10, 10)
    expect(card.suite).to eq(:clubs)
    expect(card.value).to eq(10)
  end

  it "has a value of 10 for facecards" do
    facecards = ["J", "Q", "K"]
    facecards.each do |facecard|
      card = Blackjack::Card.new(:hearts, facecard, 10)
      expect(card.value).to eq(10)
    end
  end
  it "has a value of 4 for the 4 of clubs" do
    card = Blackjack::Card.new(:clubs, 4, 4)
    expect(card.value).to eq(4)
  end

  it "returns 11 and 1 for Ace" do
    card = Blackjack::Card.new(:diamonds, "A", [11, 1])
    expect(card.value).to eq([11, 1])
  end
end
