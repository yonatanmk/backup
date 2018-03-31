# Your code, here.

sum = 0
while true
  puts "Please enter how much money you've made from sales."
  sum += sprintf("%.2f", gets.chomp).to_f
  if sum > 100
    puts "Congratulations! You have passed $100 in sales."
    puts "You have made $#{sprintf("%.2f", sum)}."
    break
  else
    puts "In total you have made $#{sprintf("%.2f", sum)} in sales."
  end
end
