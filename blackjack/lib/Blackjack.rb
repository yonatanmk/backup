require_relative "card"
require_relative "deck"
require_relative "hand"
require 'Pry'

def replay
  loop do
    puts "Do you want to play another round? (yes or no)"
    play_again_answer = gets.chomp.downcase
    puts
    if play_again_answer == "y" || play_again_answer == "yes"
      return true
    elsif play_again_answer == "n" || play_again_answer == "no"
      puts "Ending the game..."
      return false
    else
      puts "Please only enter yes or no."
    end
  end
end



loop do
  game_over = false
  deck = Deck.new

  player = Hand.new(deck.draw_card, deck.draw_card)
  computer = Hand.new(deck.draw_card, deck.draw_card)
  system 'clear'
  puts "Welcome to Blackjack!"
  puts

  puts "Player was dealt #{player.show_card_at(0)}"
  puts "Player was dealt #{player.show_card_at(1)}"
  puts
  puts "Dealer was dealt #{computer.show_card_at(0)}"
  puts

  loop do
    print "Player Hand: "
    player.show_hand
    puts "Dealer Hand: #{computer.show_card_at(0)} Total = #{computer.card_list[0].value}"
    if player.hand_total > 21
      puts "Bust! You lose..."
      game_over = true
      break
    elsif player.hand_total == 21
      puts "Blackjack!"
      break
    end
    print "Hit or stay (H/S): "
    action = ""
    loop do
    action = gets.chomp.downcase
      if ['h', 's'].include?(action)
        break
      else
        puts 'Please enter H or S'
      end
    end
    puts
    if action == 'h'
      player.hit_me(deck.draw_card)
      puts "Player was dealt #{player.show_card_at(-1)}"

    else
      puts 'Player decides to stay'
      break
    end
    puts
  end
  unless game_over
    puts
    puts "Dealer was dealt #{computer.show_card_at(1)}"
    loop do
      print "Dealer Hand: "
      computer.show_hand
      if computer.hand_total > 21
        puts "Bust! You Win!"
        game_over = true
        break
      elsif computer.hand_total == 21
        puts "Blackjack!"
        break
      end
      puts
      if computer.hand_total < 17
        computer.hit_me(deck.draw_card)
        puts "Dealer was dealt #{computer.show_card_at(-1)}"
        sleep(1)
      else
        puts "Dealer stays"
        break
      end
    end
  end
  unless game_over
    puts
    puts "Final Scores:"
    puts "Player Total: #{player.hand_total}"
    puts "Dealer Total: #{computer.hand_total}"

    if player.hand_total > computer.hand_total
      puts "You Win!"
    elsif player.hand_total == computer.hand_total
      puts "You Tie!"
    else
      puts "You Lose!"
    end
  end

  break unless replay
end

# binding.pry
