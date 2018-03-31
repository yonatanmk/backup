items_we_have = "chips popcorn skittles clif-bar mentos gum cheetos m&ms"

puts "Which item would you like?"
item = gets.chomp.downcase
if items_we_have.index(item).nil?
  puts "We do not carry that item."
else
  print "Item index: "
  puts items_we_have.index(item)
end
