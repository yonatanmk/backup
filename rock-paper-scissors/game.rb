# YOUR CODE GOES HERE
system "clear"
puts "Welcome to Rock Paper Scissor"

comp_decision = rand(1..3)
if comp_decision == 1
  comp_decision = "Rock"
elsif comp_decision == 2
  comp_decision = "Paper"
else
  comp_decision = "Scissor"
end

while true
  puts "Choose Rock (R), Paper (P), or Scissor (S)."
  player_decision = gets.chomp.downcase
  if player_decision == "r"
    player_decision = "Rock"
    break
  elsif player_decision == "p"
    player_decision = "Paper"
    break
  elsif player_decision == "s"
    player_decision = "Scissor"
    break
  else
    puts "ERROR: Please enter R, P or S"
  end
end

puts "You chose #{player_decision}"
puts "The computer chose #{comp_decision}"

if player_decision == "Rock"
  if comp_decision == "Rock"
    puts "Tie!"
  elsif comp_decision == "Paper"
    puts "Paper beats Rock, Computer Wins!"
  else
    puts "Rock beats Scissor, Player Wins!"
  end
elsif player_decision == "Paper"
  if comp_decision == "Rock"
    puts "Paper beats Rock, Player Wins!"
  elsif comp_decision == "Paper"
    puts "Tie!"
  else
    puts "Scissor beats Paper, Computer Wins!"
  end
else
  if comp_decision == "Rock"
    puts "Rock beats Scissor, Computer Wins!"
  elsif comp_decision == "Paper"
    puts "Scissor beats Paper, Player Wins!"
  else
    puts "Tie!"
  end
end
