require 'Pry'

train_times = [2,5,7.5,8.5,9,10,11.5,13.5,14.5,17,18,19,24]

time = "time"
until time.to_f < 24 && (time.to_i.to_s == time || time.to_f.to_s == time)
  puts "What time are you leaving?"
  time = gets.chomp
  unless time.to_f < 24 && (time.to_i.to_s == time || time.to_f.to_s == time)
    puts "Sorry, I do not understand that time."
  end
end

time = time.to_f
next_train_num = nil
next_train_time = nil
on_arrival = nil
train_times.each_with_index do |x, index|
  if x == time
    on_arrival = true   #in case user arrives when train is scheduled for departure
  elsif x > time
    next_train_time = x
    next_train_num = index + 1
    break
  end
end

next_train_time = sprintf("%.2f",next_train_time)  #reformats time output

puts "If you're REALLLLLLLLY fast, you can catch Train #{next_train_num - 1} leaving NOW." if on_arrival

puts "#{"Otherwise, y" if on_arrival}#{"Y" if on_arrival.nil?}ou should catch Train #{next_train_num} leaving at #{next_train_time}."

if next_train_time == "24.00"
  puts
  puts "***DON'T STOP...BELIEVIN'!***

  Just a small town girl
  Living in a lonely world
  She took the midnight train going anywhere
  Just a city boy
  Born and raised in South Detroit
  He took the midnight train going anywhere

  A singer in a smoky room
  A smell of wine and cheap perfume
  For a smile they can share the night
  It goes on and on and on and on

  Strangers waiting, up and down the boulevard
  Their shadows searching in the night
  Streetlights people, living just to find emotion
  Hiding, somewhere in the night."
end
