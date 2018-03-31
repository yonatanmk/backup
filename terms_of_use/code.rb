def disclaimer
  puts '***DISCLAIMER***'
  puts 'This code may not work the way you expect!'
  puts "By using this temperamental program, you agree not to\nsue the pants off of its creator."
  puts '***'
  puts
end

loop do
  disclaimer
  puts 'You must accept our disclaimer to proceed! Do you accept? (y/n)'
  input = gets.chomp.downcase
  break if input == 'y'
end
puts "3 + 2 = #{rand(6)}"
