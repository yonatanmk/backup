def perimeter (width, height = nil)
  return width * 4 unless height
  return width * 2 + height * 2
end

puts perimeter(2,4)
puts perimeter(3,40)
puts perimeter(10)
