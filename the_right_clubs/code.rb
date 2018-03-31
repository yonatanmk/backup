#REQUIRED_BAG_SIZE = 10

available_clubs = [
  :two_iron,
  :three_iron,
  :four_iron,
  :five_iron,
  :six_iron,
  :seven_iron,
  :eight_iron,
  :nine_iron,
  :pitching_wedge,
  :sand_wedge,
  :driver,
  :three_wood,
  :five_wood,
  :seven_wood,
  :putter
]

#possible_club_selections = available_clubs.sample(REQUIRED_BAG_SIZE)

# YOUR CODE GOES BELOW
required = [:driver,:pitching_wedge,:putter]
golf_bag = []
10.times do
  while true
    club = available_clubs.sample
    unless golf_bag.include?(club)
      golf_bag << club
      break
    end
  end
end

puts "***Automated Golf Club Advice:***"
golf_bag.each do |x|
  puts "Use the #{x}!"
end

puts
required.each do |x|
  unless golf_bag.include?(x)
    puts "WARNING! You will be without a #{x}"
  end
end
