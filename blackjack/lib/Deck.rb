class Deck
  require_relative 'Card.rb'
  attr_reader :cards_remaining

  def initialize
    @cards_remaining = []
    ['♠', '♥', '♦', '♣'].each do |sym|
      (2..10).each do |num|
        @cards_remaining << Card.new(num.to_s, sym)
      end
      ['J', 'Q', 'K', 'A'].each do |face|
        @cards_remaining << Card.new(face, sym)
      end
    end
  end

  def draw_card
    return @cards_remaining.delete_at(rand(@cards_remaining.length))
  end

end
