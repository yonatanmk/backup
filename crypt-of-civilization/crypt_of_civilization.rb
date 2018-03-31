crypt_of_civilization = []
crypt_of_civilization << "Comptometer"
crypt_of_civilization << "Box of phonographic records"
crypt_of_civilization << "Plastic savings bank"
crypt_of_civilization << "Set of scales"
crypt_of_civilization << "Toast-O-Lator"
crypt_of_civilization << "Sample of aluminum foil"
crypt_of_civilization << "Donald Duck doll"

extra = ["Container of beer", "Lionel model train set", "Ingraham pocket watch"]

crypt_of_civilization = crypt_of_civilization + extra

puts "How many items are in the array?"
puts crypt_of_civilization.length
puts
puts "What is the first item in the array?"
puts crypt_of_civilization.first
puts
puts "What is the last item in the array?"
puts crypt_of_civilization.last
puts
puts "What is the second item in the array?"
puts crypt_of_civilization[1]
puts
puts "What is the third item in the array?"
puts crypt_of_civilization[2]
puts
puts "What is the second from last item in the array?"
puts crypt_of_civilization[-2]
puts
puts 'What is the index of "Toast-O-Lator"?'
puts crypt_of_civilization.index("Toast-O-Lator")
puts
puts 'Does the array contain "Container of beer"?'
puts crypt_of_civilization.include?("Container of beer")
puts
puts 'Does the array contain "Toast-O-Lator"?'
puts crypt_of_civilization.include?("Toast-O-Lator")
puts
puts 'Does the array contain "Plastic bird"?'
puts crypt_of_civilization.include?("Plastic bird")
puts
puts "Sort by word length:"
puts crypt_of_civilization.sort_by { |item| item.length }
puts
puts "Sort in alphabetical order:"
puts crypt_of_civilization.sort
puts
puts "Sort in reverse alphabetical order:"
puts crypt_of_civilization.sort.reverse
puts

counter = 0
while counter < crypt_of_civilization.length
  puts crypt_of_civilization[counter]
  counter += 1
end

crypt_of_civilization.each do |item|
  puts item
end

crypt_of_civilization.shift
crypt_of_civilization.pop
crypt_of_civilization.delete("Set of scales")
crypt_of_civilization.delete("Sample of aluminum foil")

puts crypt_of_civilization
