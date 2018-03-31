puts "Welcome to my snow shoveling business."
puts "Here's our pricing chart:"
puts "0 - 49 cubic ft:\t$20"
puts "50 - 149 cubic ft:\t$50"
puts "150 - 299 cubic ft:\t$100"
puts "300+ cubic ft:\t\t$150"
puts "THe snow today is 8 in deep."
puts "Lets get a price estimate for shoveling your driveway"
puts "How long is your driveway? (in ft)"
length = gets.chomp.to_i
puts "How wide is your driveway? (in ft)"
width = gets.chomp.to_i

snow_depth = 8.00 / 12
cubic_ft = (snow_depth * length * width).round
cost = 0

if cubic_ft < 50
  cost = 20
elsif cubic_ft < 150
  cost = 50
elsif cubic_ft < 300
  cost = 100
else
  cost = 150
end

puts "Your driveway is approximately #{cubic_ft} cubic ft."
puts "A shoveling job will cost $#{cost}."
