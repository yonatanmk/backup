knife_total = (2.10 + 0.77 + 5 + 1 + 3).round(2)

torch_total = (6 + 3.5 + 7).round(2)

balancing_total = (2 + 1).round(2)

blockhead_total = (0.77 + 0.43).round(2)

total_income = (knife_total + torch_total + blockhead_total + balancing_total).round(2)

average_tip = (total_income / 12).round(2)

puts "Knife Juggling:\n$#{knife_total}"
puts "Torch Juggling:\n$#{torch_total}0"

puts "Hand Balancing:\n$#{balancing_total}0"
puts "Human Blockhead:\n$#{blockhead_total}0"

puts
puts "Your total income is $#{total_income}"
puts "Your average tip was $#{average_tip}"
