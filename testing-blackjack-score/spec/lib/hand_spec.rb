require "spec_helper"

describe Hand do
  # These UTF-8 characters will be useful for making different hands:
  # '♦', '♣', '♠', '♥'

  # let(:hand) { Hand.new(["10♦", "J♥"]) }

  # You can add more sample hands

  describe "#calculate_hand" do

    # Add your remaining tests here.
    it "calculates hand total with number cards" do
      hand = Hand.new(["3♣", "6♠"])
      expect(hand.calculate_hand).to eq(9)
    end

    it "calculates hand total with face cards" do
      hand = Hand.new(["10♦", "J♥"])
      expect(hand.calculate_hand).to eq(20)
    end

    it "calculates hand total with high ace cards" do
      hand = Hand.new(["3♥", "A♠"])
      expect(hand.calculate_hand).to eq(14)
    end

    it "calculates hand total with low ace cards" do
      hand = Hand.new(["3♥", "A♠", "Q♦"])
      expect(hand.calculate_hand).to eq(14)
    end

    it "calculates hand total with multiple ace cards" do
      hand = Hand.new(["A♥", "A♠", "A♦"])
      expect(hand.calculate_hand).to eq(13)
    end
  end
end
