puts "Hello, I'm the first and only Talking Vending Machine.\nWhat would you like today?"
item = gets.chomp
puts "How many of those would you like?"

while true
  num = gets.chomp.downcase
  if num.index("tons")
    while true
      rand_num = rand(14)
      puts item
      break if rand_num == 0
    end
    break
  elsif num.to_i.to_s == num
    num.to_i.times do
      puts item
    end
    break
  else
    puts "That is not an amount."
  end
end
puts "There you go! Come again!"
