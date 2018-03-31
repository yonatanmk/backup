def average(grades)
  avg = grades.inject(0) { |sum, num| sum + num / grades.length.to_f }
  return sprintf('%0.1f', avg).to_f
end

def letter_grade(grade)
  if grade >= 90
    return 'A'
  elsif grade >= 80
    return 'B'
  elsif grade >= 70
    return 'C'
  elsif grade >= 60
    return 'D'
  else
    return 'F'
  end
end

def rankings(students)
  students.each_with_index do |student, rank|
    puts "#{rank + 1}. #{student}"
  end
end

puts 'Jane'
puts average([98, 95, 88, 97, 74])
puts letter_grade(average([98, 95, 88, 97, 74]))
puts 'Samantha'
puts average([85, 93, 98, 88, 49])
puts letter_grade(average([85, 93, 98, 88, 49]))
puts 'Matt'
puts average([87, 93, 89, 97, 65])
puts letter_grade(average([87, 93, 89, 97, 65]))
puts

rankings(['Johnny', 'Jane', 'Sally', 'Elizabeth', 'Michael'])
