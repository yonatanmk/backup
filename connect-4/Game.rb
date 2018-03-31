require './Board.rb'
require './Player.rb'
require './methods.rb'
require 'Pry'

include Game_methods

class Game
  def initialize
    @x_axis_length = 0
    @y_axis_length = 0
    @turn = 0
    @board = nil
    @tie = false
    @player = "O"
    @player1 = nil
    @player2 = nil
  end

  def start
    system "clear"
    puts "Welcome to Connect Four"
    puts
    puts "Player 1, what is your name?"
    @player1 = Player.new(gets.chomp.capitalize, 'X')
    puts "Player 2, what is your name?"
    @player2 = Player.new(gets.chomp.capitalize, 'O')

    system "clear"
    puts "How many columns should the board have?"
    @x_axis_length = num_filter
    puts "How many rows should the board have?"
    @y_axis_length = num_filter
    loop do
      @board = Board.new(@x_axis_length, @y_axis_length)
      @turn = 0
      @tie = false
      until @board.check_win
        self.display
        @player = @player2
        @player = @player1 if @turn % 2 == 0
        @board.play(@player)
        @turn += 1

        if @turn == @x_axis_length * @y_axis_length
          @tie = true
          break
        end
      end

      self.display

      if @tie == true
        puts "It's a tie."
      else
        puts "#{@player.name} wins!"
      end

      if self.replay
        @player1, @player2 = @player2, @player1
      else
        break
      end
    end
  end

  def display
    system "clear"
    puts "   Welcome to Connect Four"
    puts
    @board.print_board
  end

end



game = Game.new
game.start
