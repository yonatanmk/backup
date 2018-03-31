puts 'Welcome to my dice game.'
gets

loop do
  die1 = rand(1..6)
  die2 = rand(1..6)
  print "You rolled a #{die1} and a #{die2}."
  puts " Total: #{die1 + die2}"
  puts  "Press 'Enter' to roll again, 'S' to stop"
  input = gets.chomp.downcase
  break if input == 's'
end
