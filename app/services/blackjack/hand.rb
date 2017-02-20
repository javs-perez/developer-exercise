module Blackjack
  class Hand
    attr_reader :cards

    def initialize
      @cards = []
    end

    def hit!(deck)
      @cards << deck.deal_card
    end

    def value
      high_val =
        cards.inject(0) do |sum, card|
          if card.value.is_a?(Integer)
            sum += card.value
          else
            sum += card.value.first
          end
        end
      low_val =
        cards.inject(0) do |sum, card|
          if card.value.is_a?(Integer)
            sum += card.value
          else
            sum += card.value.last
          end
        end

      pick_best_value(high_val, low_val)
    end

    def play_as_dealer(deck)
      if value < 17
        hit!(deck)
        play_as_dealer(deck)
      end
    end

    def pick_best_value(high, low)
      if high > 16 && high < 22
        high
      else
        low
      end
    end
  end
end
