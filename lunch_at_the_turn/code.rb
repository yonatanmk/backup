menu = {
  'Hamburger' => 400,
  'Hot Dog' => 300,
  'Fries' => 200,
  'Chips' => 100,
  'Water' => 125,
  'Soda' => 150
}

repeat = true

while repeat == true
  repeat = false
  total = 0
  puts 'May I take your order?'
  order = gets.chomp.split(',')
  false_items = []
  order.each do |item|
    item = item.split(' ').map { |x| x.downcase.capitalize }.join(' ')
    if menu.keys.include?(item)
      total += menu[item]
    else
      false_items << item
      repeat = true
    end
  end
  case false_items.length
  when 0
  when 1
    puts "Sorry! We don't have #{false_items[0]} on the menu"
  when 2
    puts "Sorry! We don't have #{false_items[0]} or #{false_items[1]} on the menu"
  else
    apology = "Sorry! We don't have #{false_items[0]}"
    (1..false_items.length - 2).each do |item_num|
      apology += ", #{false_items[item_num]}"
    end
    apology += " or #{false_items.last} on the menu"
    puts apology
  end
end
puts "Thanks! Your total is $#{'%.2f' % (total.to_f / 100)}. Have a nice day!"
