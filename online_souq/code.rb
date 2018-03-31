puts "Hello shopper! What is your name?"
name = gets.chomp.capitalize
available_items = ["old paperback book","potato","red onion","dried lemon","frankincense","medicinal herbs","saffron","glass spice jar","red fabric","orange fabric","handicrafts","small Persian rug","medium Persian rug","large Persian rug","extra large Persian rug"]
cart = []
unavailable = []
puts "Here's a list of item we currently have on stock:"
puts "* old paperback book\n* potato\n* red onion\n* dried lemon\n* frankincense\n* medicinal herbs\n* saffron\n* glass spice jar\n* red fabric"
puts "orange fabric\n* handicrafts\n* small Persian rug\n* medium Persian rug\n* large Persian rug\n* extra large Persian rug\n\n"
puts "What would you like to add to your cart?"

while true
  order = gets.chomp
  if available_items.include?(order)
    cart << order
    puts "The item has been added to your cart. Anything else?"
  elsif order == "done"
    break
  else
    unavailable << order unless order == "" or unavailable.include?(order)  #prevent user from entering nothing or having duplicates in the unavailable array
    puts "We're sorry. We do not have that item at the moment. Anything else?"
  end
  puts 'Type "done" to finish adding items to your cart.'
end

puts "\n#{name}, thanks for trying our online Souq platform. Here is a list of items in your cart!:"

cart.each do |item|
  puts "* #{item}"
end


puts "\nBtw, we noticed you tried entering in some items that aren't part of the online
Souq. We don't have the following items yet but will let you know if they show
up!:"

unavailable.each do |item|
  puts "* #{item}"
end
