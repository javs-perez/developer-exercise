require "rails_helper"

RSpec.describe Blackjack::Deck do
  it "builds a 52 cards deck" do
    expect(Blackjack::Deck.new.playable_cards.length).to eq 52
  end
end
