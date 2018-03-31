require 'Pry'

puts "Welcome to the Guessing Game! What difficulty would you like to play?\nType easy or hard:"
difficulty = gets.chomp.downcase
difficulty = 10 if difficulty == "easy"
difficulty = 20 if difficulty == "hard"
num = rand(1..difficulty)
binding.pry
puts "I've picked a number between 1 and #{difficulty}. Now guess it!"
guess = gets.chomp.to_i
count = 1
until guess == num
  puts "Nope, try again."
  guess = gets.chomp.to_i
  count += 1
end

puts "You win! Nice job!"
puts "Your score was: #{count}"
