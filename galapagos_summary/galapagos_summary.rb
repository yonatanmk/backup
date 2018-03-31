print "The date you leave (Month Day): "
leave_date = gets.chomp

print "The date you return home (Month Day): "
return_date = gets.chomp

print "The hotel name: "
hotel = gets.chomp

print "The number of iguanas you see: "
iguanas = gets.chomp.to_i

print "The name of your favorite beach: "
favorite_beach = gets.chomp

print "The number of giant tortoises you see: "
tortoises = gets.chomp.to_i

puts "We left on #{leave_date} for The Galapagos Islands and stayed at the #{hotel} hotel. During
the trip I saw over #{iguanas + tortoises} animals. My favorite beach during the trip was #{favorite_beach}.
After an amazing trip we returned on #{return_date}.  Can't wait to go back!"
