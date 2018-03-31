def print_grid(board)
  board.each_with_index do |row, row_index|
    row.each_with_index do |column, col_index|
      print " #{column ? column : ' '} "
      if col_index == 2
        puts
      else
        print '|'
      end
    end
    puts '-----------' unless row_index == 2
  end
end

board_a = [
  ['x', 'o', 'x'],
  ['x', nil, 'o'],
  ['x', 'o', nil]
]

board_b = [
  [nil, 'o', 'x'],
  ['x', 'o', nil],
  ['x', 'o', nil]
]

print_grid(board_a)
puts
print_grid(board_b)
