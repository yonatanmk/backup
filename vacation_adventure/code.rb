puts "You ask the computer: Sailing, Animal Reservation, or Jet Skiing?"
decision = rand(1..3)
print "The computer has decided: "
if decision == 1
  puts "Sailing!"
elsif decision == 2
  puts "Animal Reservation Adventure!"
else
  puts "Jet Skiing!"
end
