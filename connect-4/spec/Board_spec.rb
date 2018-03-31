require_relative '../Board.rb'
require_relative '../Player.rb'
require 'Pry'
# ♠ ♥ ♦ ♣

describe 'Board:' do
  subject(:board) {Board.new(5, 4)}
  let(:player) {Player.new('Steve', 'X')}

  describe '#initialize' do
    it "has @x_axis_length" do
      expect(board.x_axis_length).to eq(5)
    end

    it "has @y_axis_length" do
      expect(board.y_axis_length).to eq(4)
    end

    it "makes a board" do
      board_array =
      [[[1, " "], [2, " "], [3, " "], [4, " "], [5, " "]],
      [[1, " "], [2, " "], [3, " "], [4, " "], [5, " "]],
      [[1, " "], [2, " "], [3, " "], [4, " "], [5, " "]],
      [[1, " "], [2, " "], [3, " "], [4, " "], [5, " "]]]
      expect(board.board).to eq(board_array)
    end

    it "makes a line property" do
      expect(board.lines).to eq("---------------------")
    end

    it "makes a labels property" do
      expect(board.labels).to eq("  A   B   C   D   E   ")
    end

    it "makes a play_options property" do
      expect(board.play_options).to eq(["A", "B", "C", "D", "E"])
    end
  end

  describe '#play' do

    it "outputs appropriate prompt" do
      board.stub(:gets){"A"}
      expect{board.play(player)}.to output("Steve, where would you like to go? (A-E)\n").to_stdout
    end

    it "recieves error with wrong input" do
      board.stub(:gets).and_return("f","c")
      expect{board.play(player)}.to output("Steve, where would you like to go? (A-E)\nThat is not an option.\n").to_stdout
    end

    it "plays with input A" do
      board.stub(:gets){"A"}
      board.play(player)
      board_array =
      [[[1, " "], [2, " "], [3, " "], [4, " "], [5, " "]],
      [[1, " "], [2, " "], [3, " "], [4, " "], [5, " "]],
      [[1, " "], [2, " "], [3, " "], [4, " "], [5, " "]],
      [[1, "X"], [2, " "], [3, " "], [4, " "], [5, " "]]]
      expect(board.board).to eq(board_array)
    end

    it "plays with input D" do
      board.stub(:gets){"D"}
      board.play(player)
      board_array =
      [[[1, " "], [2, " "], [3, " "], [4, " "], [5, " "]],
      [[1, " "], [2, " "], [3, " "], [4, " "], [5, " "]],
      [[1, " "], [2, " "], [3, " "], [4, " "], [5, " "]],
      [[1, " "], [2, " "], [3, " "], [4, "X"], [5, " "]]]
      expect(board.board).to eq(board_array)
    end

    it "plays with input e" do
      board.stub(:gets){"e"}
      board.play(player)
      board_array =
      [[[1, " "], [2, " "], [3, " "], [4, " "], [5, " "]],
      [[1, " "], [2, " "], [3, " "], [4, " "], [5, " "]],
      [[1, " "], [2, " "], [3, " "], [4, " "], [5, " "]],
      [[1, " "], [2, " "], [3, " "], [4, " "], [5, "X"]]]
      expect(board.board).to eq(board_array)
    end

    it "plays in same column stack" do
      board.stub(:gets){"B"}
      board.play(player)
      board.play(player)
      board_array =
      [[[1, " "], [2, " "], [3, " "], [4, " "], [5, " "]],
      [[1, " "], [2, " "], [3, " "], [4, " "], [5, " "]],
      [[1, " "], [2, "X"], [3, " "], [4, " "], [5, " "]],
      [[1, " "], [2, "X"], [3, " "], [4, " "], [5, " "]]]
      expect(board.board).to eq(board_array)
    end

    it "recieves error if column is full" do
      board.stub(:gets).and_return("b","c")
      board.board =
      [[[1, " "], [2, "X"], [3, " "], [4, " "], [5, " "]],
      [[1, " "], [2, "X"], [3, " "], [4, " "], [5, " "]],
      [[1, " "], [2, "X"], [3, " "], [4, " "], [5, " "]],
      [[1, " "], [2, "X"], [3, " "], [4, " "], [5, " "]]]
      expect{board.play(player)}.to output("Steve, where would you like to go? (A-E)\nThat column is full.\n").to_stdout
    end
  end


  describe '#print_board' do
    it 'prints out an empty board' do
      board_output = "  A   B   C   D   E   \n"+
"|   |   |   |   |   |\n"+
"---------------------\n"+
"|   |   |   |   |   |\n"+
"---------------------\n"+
"|   |   |   |   |   |\n"+
"---------------------\n"+
"|   |   |   |   |   |\n"+
"---------------------\n"
      expect{board.print_board}.to output(board_output).to_stdout
    end

    it 'prints out a board with some plays' do
      board.board =
      [[[1, "X"], [2, "O"], [3, " "], [4, " "], [5, " "]],
      [[1, " "], [2, "X"], [3, " "], [4, "X"], [5, "O"]],
      [[1, " "], [2, "X"], [3, " "], [4, " "], [5, " "]],
      [[1, "O"], [2, "X"], [3, " "], [4, "O"], [5, " "]]]
      board_output = "  A   B   C   D   E   \n"+
"| X | O |   |   |   |\n"+
"---------------------\n"+
"|   | X |   | X | O |\n"+
"---------------------\n"+
"|   | X |   |   |   |\n"+
"---------------------\n"+
"| O | X |   | O |   |\n"+
"---------------------\n"
      expect{board.print_board}.to output(board_output).to_stdout
    end
  end

end
