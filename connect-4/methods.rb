module Game_methods
  def replay
    while true
      puts "Do you want to play again? (yes or no)"
      play_again_answer = gets.chomp.downcase
      puts
      if play_again_answer == "y" || play_again_answer == "yes"
        puts "Starting a new game..."
        return true
      elsif play_again_answer == "n" || play_again_answer == "no"
        puts "Ending the game..."
        return false
      else
        puts "Please only enter yes or no."
      end
    end
  end

  def num_filter
    loop do
      x = gets.chomp
      if x.to_i.to_s != x
        puts "Please enter an integer."
      elsif x.to_i > 20 || x.to_i < 4
        puts "Please enter an integer between 4 and 20."
      else
        return x.to_i
      end
    end
  end
end
