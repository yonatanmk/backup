require 'Pry'

dramas = [
  "Stanger Llamas",
  "Game of Bones",
  "Llama Actually",
  "Grey's Catanomy",
  "Breaking Baaaaahhhd"
]

animations = [
  "Bojack Man",
  "Family Dog",
  "Futurellama",
  "Barkcher",
  "American Dog",
  "Pokemon",
  "Bob's Barkers"
]

comedies = [
  "Barks and Recreation",
  "30 Cats",
  "Bones",
  "Girl meets Cat",
  "Gilmore Cats",
  "New Dog",
  "Catlandia",
  "Full Mouse"
]

all_shows = [
  "Stanger Llamas",
  "Game of Bones",
  "Llama Actually",
  "Grey's Catanomy",
  "Breaking Baaaaahhhd",
  "Bojack Man",
  "Family Dog",
  "Futurellama",
  "Barkcher",
  "American Dog",
  "Pokemon",
  "Bob's Barkers",
  "Barks and Recreation",
  "30 Cats",
  "Bones",
  "Girl meets Cat",
  "Gilmore Cats",
  "New Dog",
  "Catlandia",
  "Full Mouse"
]
#_______________________________________________________________

llama_dramas = dramas.select { |show| show.index("Llama")}
puts llama_dramas
puts

dog_animations = animations.select { |show| show.index("Dog")}
puts dog_animations
puts

not_cat_comedies = comedies.reject { |show| show.index("Cat")}
puts not_cat_comedies
puts

first_letters = all_shows.map { |show| show[0]}
puts first_letters
#binding.pry

puts "Nnnnnnn"
puts "\n"
puts "Nnnnnnn"
puts
puts "Nnnnnnn"
