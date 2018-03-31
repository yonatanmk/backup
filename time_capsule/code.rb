time_capsule = []
puts "Hello. What's your name?"
name = gets.chomp.capitalize
puts
puts "What would you like to add to your time capsule?"
input = gets.chomp
until input == "FINISHED"
  puts
  puts "How many would you like to add to your time capsule?"
  count = gets.chomp
  time_capsule << "#{input} (#{count})"
  puts "\nOkay, we added #{count} #{input}s to your time capsule. Anything else?"
  puts 'Type "FINISHED" to stop adding items.'
  input = gets.chomp
end
puts

puts "#{name}, thanks for trying our Time Capsule maker. Here is a list of the items in your Time Capsule!:"
time_capsule.each do |item|
  puts "* " + item
end
