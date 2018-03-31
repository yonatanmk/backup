transactions = [50_000, -2_000, -25_000, 4_000, -12_000, 5_000, -800, -900, 43_000, -30_000, 15_000, 62_000, -50_000, 42_000]

# Write Ruby code to find out the answers to the following questions:

# * What is the value of the first transaction?
puts "What is the value of the first transaction?"
puts transactions.first
puts
# * What is the value of the second transaction?
puts "What is the value of the second transaction?"
puts transactions[1]
puts
# * What is the value of the fourth transaction?
puts "What is the value of the fourth transaction?"
puts transactions[5]
puts
# * What is the value of the last transaction?
puts "What is the value of the last transaction?"
puts transactions.last
puts
# * What is the value of the second from last transaction?
puts "What is the value of the second from last transaction?"
puts transactions[-2]
puts
# * What is the value of the 5th from last transaction?
puts "What is the value of the 5th from last transaction?"
puts transactions[-5]
puts
# * What is the value of the transaction with index 5?
puts "What is the value of the transaction with index 5"
puts transactions[5]
puts
# * How many transactions are there in total?
puts "How many transactions are there in total?"
puts transactions.length
puts
# * How many positive transactions are there in total?
puts "How many positive transactions are there in total?"
total = 0
transactions.each do |x|
  total += 1 if x > 0
end
puts total
puts
# * How many negative transactions are there in total?
puts "How many negative transactions are there in total?"
total = 0
transactions.each do |x|
  total += 1 if x < 0
end
puts total
puts
# * What is the largest withdrawal?
puts "What is the largest withdrawal?"
puts transactions.min
puts

# * What is the largest deposit?
puts "What is the largest deposit?"
puts transactions.max
puts
# * What is the smallest withdrawal?
puts "What is the smallest withdrawal?"
puts transactions.select {|x| x < 0}.max
puts
# * What is the smallest deposit?
puts "What is the smallest deposit?"
puts transactions.select {|x| x > 0}.min
puts
# * What is the total value of all the transactions?
puts "What is the total value of all the transactions?"
sum = 0
transactions.each { |x| sum+=x }
puts sum
puts
# * If Dr. Dre's initial balance was $239,900 in this account, what is the value of his balance after his last transaction?
puts "If Dr. Dre's initial balance was $239,900 in this account, what is the value of his balance after his last transaction?"
puts (239_900 + sum)
puts

best_records = {
 "Tupac"=>"All Eyez on Me",
 "Eminem"=>"The Marshall Mathers LP",
 "Wu-Tang Clan"=>"Enter the Wu-Tang (36 Chambers)",
 "Led Zeppelin"=>"Physical Graffiti",
 "Metallica"=>"The Black Album",
 "Pink Floyd"=>"The Dark Side of the Moon",
 "Pearl Jam"=>"Ten",
 "Nirvana"=>"Nevermind"
 }

# Write Ruby code to find out the answers to the following questions:

# * How many records are in `best_records`?
puts "How many records are in `best_records`?"
puts best_records.length
puts
# * Who are all the artists listed?
puts "Who are all the artists listed?"
puts best_records.keys
puts
# * What are all the album names in the hash?
puts "What are all the album names in the hash?"
puts best_records.values
puts
# * Delete the `Eminem` key-value pair from the list.
puts "Delete the `Eminem` key-value pair from the list."
best_records.delete("Eminem")
puts best_records
puts
# * Add your favorite musician and their best album to the list.
puts "Add your favorite musician and their best album to the list."
best_records["Freelance Whales"] = "Weathervanes"
puts best_records
puts
# * Change `Nirvana`'s album to another.
puts "Change `Nirvana`'s album to another."
best_records["Nirvana"] = "I don't like Nirvana"
puts best_records
puts
# * Is `Nirvana` included in `best_records`?
puts "Is `Nirvana` included in `best_records`?"
puts best_records.include?("Nirvana")
puts
# * Is `Soundgarden` included in `best_records`?
puts "Is `Soundgarden` included in `best_records`?"
puts best_records.include?("Soundgarden")
puts
# * If `Soundgarden` is not in `best_records` then add a key-value pair for the band.
puts "If `Soundgarden` is not in `best_records` then add a key-value pair for the band."
best_records["Soundgarden"] = "I don't listen to Soundgarden either"
puts best_records
puts
# * Which key-value pairs have a key that has a length less than or equal to 6 characters?
puts "Which key-value pairs have a key that has a length less than or equal to 6 characters?"
best_records.each do |artist,album|
  puts "#{artist}: #{album}" if artist.length <= 6
end
puts
# * Which key-value pairs have a value that is greater than 10 characters?
puts "Which key-value pairs have a value that is greater than 10 characters?"
best_records.each do |artist,album|
  puts "#{artist}: #{album}" if album.length > 10
end
