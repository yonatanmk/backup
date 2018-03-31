answer = ""
until answer == "no"
  puts "Can I get you anything?"
  answer = gets.chomp.downcase
end
puts "Goodbye!"
