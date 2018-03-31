puts 'Welcome to my advanced dice game.'
puts 'How many sides do your dice have?'
side_num = gets.chomp.to_i
puts 'How many times should we roll the dice?'
roll_num = gets.chomp.to_i
puts
input = ''
until input == 's'
  roll_num.times do
    die1 = rand(1..side_num)
    die2 = rand(1..side_num)
    print "You rolled a #{die1} and a #{die2}."
    puts " Total: #{die1 + die2}"
  end
  puts  "Press 'Enter' to roll again, 'S' to stop"
  input = gets.chomp.downcase
end
