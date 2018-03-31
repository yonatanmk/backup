require 'Pry'

class Board
  attr_reader :x_axis_length, :y_axis_length, :lines, :labels, :play_options
  attr_accessor :board
  def initialize x_axis_length, y_axis_length
    @x_axis_length = x_axis_length
    @y_axis_length = y_axis_length
    @board = []
    y_axis_length.times do
      @board << []
    end
    @board.each do |row|
      x_axis_length.times do |x|
        row << [x + 1, " "]
      end
    end
    @lines = '-' * (x_axis_length * 4 + 1)
    @labels = '  '
    @play_options = []
    x_axis_length.times do |x|
      @play_options << (x + 65).chr
      @labels +=  "#{(x + 65).chr}   "

    end

  end

  def print_board
    output = @labels + "\n"
    @board.each do |row|
      output += "|"
      (1..@x_axis_length).each do |column|
        output += " " + row[column - 1][1] + " |"
      end
      output += "\n#{@lines}\n"
    end
    puts output
  end

  def play(player)
    end_play = false
    puts "#{player.name}, where would you like to go? (A-#{(@x_axis_length + 64).chr})"
    until end_play == true
      column = gets.chomp.upcase      #####FIX##################################################
      if column == ""
        column = 70
      else
        column = column.ord - 64
      end
      if not @play_options.include?((column + 64).chr)
        puts "That is not an option."
      elsif @board[0][column - 1][1] != " "
        puts "That column is full."
      else
        @board.reverse_each do |row|
          row.each_index do |x|
            if row[x][0] == column && row[x][1] == " "
              row[x][1] = player.mark
              end_play = true
            end
          end
          break if end_play == true
        end
      end
    end
  end

  def check_win
    @board.reverse_each do |row_num|      #checking for horzontal wins
      (0..@x_axis_length-4).each do |column|
        #binding.pry
        if row_num[column][1] != " " && row_num[column][1] == row_num[column + 1][1] && row_num[column][1] == row_num[column + 2][1] && row_num[column][1] == row_num[column + 3][1]
          return true
        end
      end
    end
    (3..@y_axis_length-1).each do |row_num|          #checking for vertical wins
      (0..@x_axis_length-1).each do |column|
        if @board[row_num][column][1] != " " && @board[row_num][column][1] == @board[row_num - 1][column][1] && @board[row_num][column][1] == @board[row_num - 2][column][1] && @board[row_num][column][1] == @board[row_num - 3][column][1]
          return true
        end
      end
    end
    (3..@y_axis_length-1).each do |row_num|          #checking for / diagonal wins
      (0..@x_axis_length-4).each do |column|
        if @board[row_num][column][1] != " " && @board[row_num][column][1] == @board[row_num - 1][column + 1][1] && @board[row_num][column][1] == @board[row_num - 2][column + 2][1] && @board[row_num][column][1] == @board[row_num - 3][column + 3][1]
          return true
        end
      end
    end
    (3..@y_axis_length-1).each do |row_num|          #checking for \ diagonal wins
      (3..@x_axis_length-1).each do |column|
        if @board[row_num][column][1] != " " && @board[row_num][column][1] == @board[row_num - 1][column - 1][1] && @board[row_num][column][1] == @board[row_num - 2][column - 2][1] && @board[row_num][column][1] == @board[row_num - 3][column - 3][1]
          return true
        end
      end
    end
    return false
  end
end
