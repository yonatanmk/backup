class Hand
  require 'colorize'
  attr_reader :card_list

  def initialize(card1, card2)
    @card_list = [card1, card2]
  end

  def hand_total
    cards = @card_list.sort {|card, _| card.value == 11 ? 1 : -1}
    total = cards.reduce(0) do |sum, card|
      if card.value == 11 && sum > 10
        @card_list[cards.index(card)].value_to_1
        sum + 1
      else
        sum + card.value
      end
    end
    return total
  end
  #
  def hit_me card
    @card_list << card
  end

  def show_hand
    @card_list.each_with_index do |_, i|
      #binding.pry
      card_desc = self.show_card_at(i)
      print card_desc + ' '
    end
    puts "Total = #{self.hand_total}"
  end

  def show_card_at(index)
    output = "#{@card_list[index].face}#{@card_list[index].symbol}"
    if ['♥', '♦'].include?(@card_list[index].symbol)
      output = output.colorize(:red)
    else
      output = output.colorize(:black)
    end
    output = output.colorize(:background => :white)
    return output
  end
  #
  # def check_split
  #   if @card_list.length > 2
  #     return false
  #   elsif @card_list[0].value == @card_list[1].value
  #     return true
  #   else
  #     return false
  #   end
  # end

end
