data = {
  'Jon Smith' => {
    age: 25,
    income: 50_000,
    household_size: 1,
    gender: 'male',
    education: 'college'
  },
  'Jane Davies' => {
    age: 30,
    income: 60_000,
    household_size: 3,
    gender: 'female',
    education: 'high school'
  },
  'Sam Farelly' => {
    age: 32,
    income: 80_000,
    household_size: 2,
    gender: 'unspecified',
    education: 'college'
  },
  'Joan Favreau' => {
    age: 35,
    income: 65_000,
    household_size: 4,
    gender: 'female',
    education: 'college'
  },
  'Sam McNulty' => {
    age: 38,
    income: 63_000,
    household_size: 3,
    gender: 'male',
    education: 'college'
  },
  'Mark Minahan' => {
    age: 48,
    income: 78_000,
    household_size: 5,
    gender: 'male',
    education: 'high school'
  },
  'Susan Umani' => {
    age: 45,
    income: 75_000,
    household_size: 2,
    gender: 'female',
    education: 'college'
  },
  'Bill Perault' => {
    age: 24,
    income: 45_000,
    household_size: 1,
    gender: 'male',
    education: 'did not complete high school'
  },
  'Doug Stamper' => {
    age: 45,
    income: 75_000,
    household_size: 1,
    gender: 'male',
    education: 'college'
  },
  'Francis Underwood' => {
    age: 52,
    income: 100_000,
    household_size: 2,
    gender: 'male',
    education: 'college'
  }
}

demographics = {
  'Average Age' => 0,
  'Average Income' => 0,
  'Average Household Size' => 0,
  'Female %' => 0,
  'Male %' => 0,
  'Unspecified Gender %' => 0,
  'College %' => 0,
  'High School %' => 0,
  'Did Not Finish High School %' => 0
}
male_count = 0
female_count = 0
high_school_count = 0
college_count = 0
data.each do |_, info|
  demographics['Average Age'] += info[:age].to_f / data.length
  demographics['Average Income'] += info[:income].to_f / data.length
  demographics['Average Household Size'] += info[:household_size].to_f / data.length
  if info[:gender] == 'male'
    male_count += 1
  elsif info[:gender] == 'female'
    female_count += 1
  end
  if info[:education] == 'high school'
    high_school_count += 1
  elsif info[:education] == 'college'
    college_count += 1
  end
end

demographics['Female %'] = female_count / data.length.to_f * 100
demographics['Male %'] = male_count / data.length.to_f * 100
demographics['Unspecified Gender %'] = (data.length - female_count - male_count) / data.length.to_f * 100
demographics['High School %'] = high_school_count / data.length.to_f * 100
demographics['College %'] = college_count / data.length.to_f * 100
demographics['Did Not Finish High School %'] = (data.length - high_school_count - college_count) / data.length.to_f * 100

demographics.each do |key, value|
  puts "#{key}: #{'%.1f' % value}"
end
