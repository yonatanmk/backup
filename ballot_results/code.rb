# build vote results
vote_results = []
4.times do |precinct_index|
  vote_results[precinct_index] = []
  3.times do |candidate_index|
    vote_results[precinct_index][candidate_index] = rand(20..500)
  end
end

candidates = [
  'Mary Sue',
  'Sally Jane',
  'Billy Joe'
]

# list out vote results
vote_results.each_with_index do |_, precinct_index|
  puts "**In precinct #{precinct_index + 1}:**"

  candidates.each_with_index do |candidate, candidate_index|
    puts "* #{candidate} got #{vote_results[precinct_index][candidate_index]} votes"
  end

  puts ''
end

# * How many people voted in precinct 1?
puts 'How many people voted in precinct 1?'
puts vote_results[0].inject(0) { |sum, votes| sum += votes }
puts
# * Who was the winning candidate in Precinct 4?
puts 'Who was the winning candidate in Precinct 4?'
if vote_results[3].index(vote_results[3].max).zero?
  puts 'Mary Sue'
elsif vote_results[3].index(vote_results[3].max) == 1
  puts 'Sally Jane'
else
  puts 'Billy Joe'
end
puts
# * How many people voted for Mary Sue?
puts 'How many people voted for Mary Sue?'
mtotal = 0
vote_results.each do |precinct|
  mtotal += precinct[0]
end
puts mtotal
puts
# * How many people voted for Billy Joe?
puts 'How many people voted for Billy Joe?'
btotal = 0
vote_results.each do |precinct|
  btotal += precinct[2]
end
puts btotal
puts
# * How many people voted for Sally Jane?
puts 'How many people voted for Sally Jane?'
stotal = 0
vote_results.each do |precinct|
  stotal += precinct[1]
end
puts stotal
puts
# * How many people voted in total?
puts 'How many people voted in total?'
total = 0
vote_results.each do |precinct|
  total += precinct.inject(0) { |sum, votes| sum += votes }
end
puts total
puts
# * Who had the most votes?
puts 'Who had the most votes?'
if mtotal > btotal && mtotal > stotal
  puts 'Mary Sue'
elsif btotal > mtotal && btotal > stotal
  puts 'Billy Joe'
else
  puts 'Sally Jane'
end
