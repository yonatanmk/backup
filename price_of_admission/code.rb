puts "Welcome to the amusement park!"
puts "---------------------
| ADULTS: $12.80    |
| CHILDREN: $4.00   |
---------------------
"
adults = 4
children = 2
adult_cost = 12.80
child_cost = 4.00
total_cost = (adults * adult_cost + children * child_cost)
adult_payment = total_cost / adults

puts "For example, a group of #{adults} adults and #{children} kids will have to pay $#{total_cost}0 total."
puts "If the cost is evenly divided among the adults, each adult would have to pay $#{adult_payment}0."
puts
puts "How many adults are in your group?"
adults = gets.chomp.to_i
puts "How many children are in your group?"
children = gets.chomp.to_i

total_cost = (adults * adult_cost + children * child_cost)
adult_payment = total_cost / adults

puts "A group of #{adults} adult#{"s" if adults > 1} and #{children} kid#{"s" if children > 1} will have to pay $#{total_cost}0 total."
puts "If the cost is evenly divided among the adults, each adult would have to pay $#{adult_payment}0."
