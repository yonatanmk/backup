dinner_total = 178.00
tip = 20.00
tip_total = dinner_total * tip / 100.00

puts "You should tip $#{tip_total}0."
puts "The total bill is $#{dinner_total + tip_total}0."
