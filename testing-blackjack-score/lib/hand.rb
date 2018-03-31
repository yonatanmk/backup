require_relative 'deck'

class Hand
  def initialize(cards)
    @cards = cards
  end

  def calculate_hand
    cards = @cards.map {|card| card.gsub!(/\W/, "")}
    cards.sort! {|x, _| x == "A" ? 1 : -1}
    total = cards.reduce(0) do |sum, card|
      if ['J','Q','K'].include?(card)
        sum + 10
      elsif card == 'A'
        if sum > 10
          sum + 1
        else
          sum + 11
        end
      else
        sum + card.to_i
      end
    end
  end

end

deck = Deck.new
cards = deck.deal(2)
hand = Hand.new(cards)
# hand.calculate_hand # Get this working properly
