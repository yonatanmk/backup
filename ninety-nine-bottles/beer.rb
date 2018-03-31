count = 99
until count == "no more"
  print "#{count} bottle#{"s" unless count == 1} of beer on the wall, #{count} bottle#{"s" unless count == 1} of beer"
  if count % 10 == 0
    puts "!"
  else
    puts "."
  end
  count -= 1
  puts "Take one down and pass it around, #{count = "no more" if count == 0} bottle#{"s" unless count == 1} of beer on the wall.\n\n"
end
puts "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall."
