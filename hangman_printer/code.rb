def print_puzzle(word, letters = nil)
  blank = ''
  word.split('').each do |char|
    if letters && letters.include?(char)
      blank += "#{char} "
    else
      blank += '_ '
    end
  end
  return blank[0..blank.length]
end

puts print_puzzle('perimeter')
puts print_puzzle('triangle', ['t', 's', 'g'])
