clubs ={
  "driver" => 200,
  "four wood" => 180,
  "five wood" => 170,
  "two iron" => 170,
  "three iron" => 160,
  "four iron" => 150,
  "five iron" => 140,
  "six iron" => 130,
  "seven iron" => 120,
  "eight iron" => 110,
  "nine iron" => 95,
  "pitching wedge" => 80,
  "sand Wedge" => 20,
  "putter" => 0
}



puts "How far away are you?"
distance = gets.chomp.to_i

use_the = ""
clubs.each do |club, dist|
  if distance > dist
    use_the = club
    break
  end
end

puts "Use the #{use_the}!"
