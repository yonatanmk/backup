require ('Pry')

#Write Ruby<->English answers here as comments in your code

#1. puts 3 times each number in numbers
#2. puts length of each name in array
#3. puts sum of values in numbers
#4. name = key, age = value, puts name and age of each pair in hash
#5. transaction = kay, value = value, puts the sum of all values in account
#6. same as for except with adresses instead of names

array = [28214, 63061, 49928, 98565, 31769, 42316, 23674, 3540, 34953, 70282, 22077, 94710, 50353, 17107, 73683, 33287, 44575, 83602, 33350, 46583]

# Write Ruby code to find out the answers to the following questions:

# * What is the sum of all the numbers in `array`?
sum = 0
array.each do |number|
  sum += number
end
puts sum
# * How would you print out each value of the array?
array.each do |number|
  puts number
end
# * What is the sum of all of the even numbers?
sum = 0
array.each do |number|
  if number % 2 == 0
    sum += number
  end
end
puts sum
# * What is the sum of all of the odd numbers?
sum = 0
array.each do |number|
  if number % 2 == 1
    sum += number
  end
end
puts sum
# * What is the sum of all the numbers divisble by 5?
sum = 0
array.each do |number|
  if number % 5 == 0
    sum += number
  end
end
puts sum
# * What is the sum of the squares of all the numbers in the array?
sum = 0
array.each do |number|
  sum += number ** 2
end
puts sum

array = ["joanie", "annamarie", "muriel", "drew", "reva", "belle", "amari", "aida", "kaylie", "monserrate", "jovan", "elian", "stuart", "maximo", "dennis", "zakary", "louvenia", "lew", "crawford", "caitlyn"]

# Write Ruby code to find out the answers to the following questions:

# * How would you print out each name backwards in `array`?
array.each do |name|
  puts name.split("").reverse.join("")
end
# * What are the total number of characters in the names in `array`?
total = 0
array.each do |name|
  total += name.length
end
puts total
# * How many names in `array` are less than 5 characters long?
total = 0
array.each do |name|
  if name.length < 5
    total += 1
  end
end
puts total
# * How many names in `array` end in a vowel?
total = 0
vowels = ["a","e","i","o","u","y"] #Y is a vowel DANGIT
array.each do |name|
  if vowels.include?(name.split("").last)
    total += 1
  end
end
puts total
# * How many names in `array` are more than 5 characters long?
total = 0
array.each do |name|
  if name.length > 5
    total += 1
  end
end
puts total
# * How many names in `array` are exactly 5 characters in length?
total = 0
array.each do |name|
  if name.length == 5
    total += 1
  end
end
puts total

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

#  Write Ruby code to find out the answers to the following questions:

# * How would you print out all the names of the artists?
puts best_records.keys
# * How would you print out all the names of the albums?
puts best_records.values
# * Which artist has the longest name?
longest = [""]
best_records.each do |artist, album|
  if artist.length == longest[0].length
    longest << artist
  elsif artist.length > longest[0].length
    longest = [artist]
  end
end
puts longest
# * How would you change all the album titles for every artist to `Greatest Hits`?
best_records.each do |artist, album|
  best_records[artist] = "Greatest Hits"
end
print best_records
puts
# * How would you delete a key-value pair if the artist's name ends in a vowel?
best_records.delete_if {|artist, album| vowels.include?(artist.split("").last) }
print best_records
puts

ages = {"Arch"=>89, "Gretchen"=>93, "Simone"=>12, "Daija"=>96, "Alivia"=>22, "Serena"=>28, "Alek"=>3, "Lula"=>24, "Christian"=>62, "Darryl"=>47, "Otha"=>32, "Evalyn"=>44, "Lincoln"=>27, "Rebeca"=>99, "Beatrice"=>99, "Kelton"=>10, "Zachary"=>18, "Aurelie"=>91, "Dell"=>71, "Lisandro"=>22}

# Write Ruby code to find out the answers to the following questions:

# * How would you print out all the names of `ages`?
puts ages.keys
# * How would you print out each key-value pair in the format of `<name> is <age> years old.`?
ages.each do |name, age|
  puts "#{name} is #{age} years old."
end
# * How would you print out every person with odd numbered age?
ages.each do |name, age|
  puts name if age % 2 == 1
end

# * How would you delete everyone under 25 years of age?
ages.delete_if {|name, age| age < 25}
print ages
puts
# * What is the name and age of everyone with a name greater than or equal to 5 characters?
ages.each do |name, age|
  puts "#{name}: #{age}" if name.length >= 5
end

people =
{
  "Alia O'Conner PhD" => {
         "phone" => "538.741.1841",
       "company" => "Leuschke-Stiedemann",
      "children" => [
          "Simone",
          "Cindy",
          "Jess"
      ]
  },
           "Ike Haag" => {
         "phone" => "(661) 663-8352",
       "company" => "Carter Inc",
      "children" => [
          "Joe",
          "Ofelia",
          "Deron"
      ]
  },
       "Brian Heller" => {
         "phone" => "1-288-601-5886",
       "company" => "O'Conner Group",
      "children" => [
          "Renee"
      ]
  },
       "Maryse Johns" => {
         "phone" => "218-571-8774",
       "company" => "Kuhlman Group",
      "children" => [
          "Dominick",
          "Tricia"
      ]
  },
  "Dr. Adela DuBuque" => {
        "phone" => "1-203-483-1226",
      "company" => "Heidenreich, Nietzsche and Dickinson"
  }
}

# Write Ruby code to find out the answers to the following questions:

# * How would you print out all the names of `people`?
people.each do |name, info|
  puts name
end
# * How would you print out all the names of `people` and which company they work for?
people.each do |name, info|
  puts "Name: #{name}, Company: #{info["company"]}" if info["company"]
end
# * What are the names of all the children of everyone in `people`?
children = []
people.each do |name, info|
  children += info["children"] if info["children"]
end
puts children
# * What are the names of all the companies that people work for?
companies = []
people.each do |name, info|
  companies << info["company"] if info["company"]
end
puts companies
# * How would you convert all the phone numbers to the same standard (pick one)?
people.each do |name, info|
  info["phone"].gsub!(/\W/, '')
  #or info["phone"]=info["phone"].split("").select{|x| x.match(/\w/)}.join("")
  info["phone"].slice(0) if info["phone"].length > 10
  info["phone"] = info["phone"][0..2] + "-" + info["phone"][3..5] + "-" + info["phone"][6..9]
  puts info["phone"]
end

people =
[
    {
          "Derek Wehner" => {
               "phone" => "588-047-7782",
             "company" => "Daniel-Carroll",
            "children" => [
                "Phoebe",
                "Gretchen",
                "Wiley"
            ]
        },
           "Ali Koelpin" => {
               "phone" => "1-127-057-0020",
             "company" => "Rau, Rutherford and Lockman",
            "children" => [
                "Juwan"
            ]
        },
        "Ervin Prohaska" => {
               "phone" => "(393) 630-3354",
             "company" => "Carter Inc",
            "children" => [
                "Virgil",
                "Piper",
                "Josianne"
            ]
        },
          "Hellen Borer" => {
              "phone" => "1-687-825-0947",
            "company" => "Maggio, Ferry and Moen"
        }
    },
    {
        "Elinor Johnson" => {
              "phone" => "819.911.5553",
            "company" => "Pollich Group"
        }
    },
    {
        "Richmond Murray" => {
               "phone" => "1-516-432-2364",
             "company" => "Sporer and Sons",
            "children" => [
                "Kade",
                "Sage"
            ]
        },
            "Nakia Ferry" => {
               "phone" => "134-079-2237",
             "company" => "Hamill, O'Keefe and Lehner",
            "children" => [
                "Rollin"
            ]
        }
    }
]

# Write Ruby code to find out the answers to the following questions:

# * What are the names of everyone in `people`?
people.each do |person|
  puts person.keys
end
# * What are the names of all the children in `people`?
children = []
people.each do |person|
    person.each do |name, info|
      children += info["children"] if info["children"]
  end
end
puts children

# * How would you create a new hash called `phone_numbers` that has a key of a name and value of a phone number in `people`?
phone_numbers = {}
people.each do |person|
  person.each do |name, info|
    phone_numbers["#{name}"] = info["phone"]
  end
end
puts phone_numbers
# * How would you create a new hash called `employers` that has a key of a name and a value of a company name in `people`?
employers = {}
people.each do |person|
  person.each do |name, info|
    employers["#{name}"] = info["company"]
  end
end
puts employers
# * How would you create a new hash called `children_count` that has a key of a name and a value of the number of children a person has?
children_count = {}
people.each do |person|
  person.each do |name, info|
    if info["children"]
      children_count["#{name}"] = info["children"].length
    else
      children_count["#{name}"] = 0
    end
  end
end
puts children_count
