require "simplecov"
SimpleCov.start
require "pry"
require_relative "../code"

# YOUR TEST CODE HERE
RSpec.describe "perimeter" do
  it "returns 20 for a square with a width of 5" do
    expect(perimeter(5)).to eq(20)
  end

  it "returns 30 for a rectangle with a width of 5 and a length of 10" do
    expect(perimeter(5,10)).to eq(30)
  end
end

RSpec.describe "average" do
  it "returns 1 for grade list [1]" do
    expect(average([1])).to eq(1)
  end
  it "returns 2 for grade list [3,1,2]" do
    expect(average([3,1,2])).to eq(2)
  end
  it "returns 6.666666666666667 for grade list [13,4,3]" do
    expect(average([13,4,3])).to eq(6.666666666666667)
  end
end

RSpec.describe "rankings" do
  student_list = ['Mark','Judas','Evelyn']
  output = "1. Mark\n2. Judas\n3. Evelyn\n"
  it "ranks 3 students" do
    expect(rankings(student_list)).to eq(output)
  end
  student_list = ['Mark','Judas','Evelyn', 'Christian', 'Anna']
  output = "1. Mark\n2. Judas\n3. Evelyn\n4. Christian\n5. Anna\n"
  it "ranks 5 students" do
    expect(rankings(student_list)).to eq(output)
  end
end

RSpec.describe 'greet' do
  it 'accepts no language' do
    expect(greet('Mark')).to eq("Hi Mark!")
  end
  it 'accepts English' do
    expect(greet('Markey', 'english')).to eq("Hi Markey!")
  end
  it 'accepts italian' do
    expect(greet('Marco', 'italian')).to eq("Ciao Marco!")
  end
  it 'accepts french' do
    expect(greet('Marque', 'french')).to eq("Bonjour Marque!")
  end
  it 'accepts spanish' do
    expect(greet('Marcus', 'spanish')).to eq("Hola Marcus!")
  end
end

RSpec.describe "create_puzzle" do
  context 'for the word "car"' do
    it 'prints all blanks when array is empty' do
      expect(create_puzzle('car')).to eq('_ _ _')
    end

    it 'prints all a when array = ["a"]' do
      expect(create_puzzle('car', ['a'])).to eq('_ a _')
    end

    it 'prints full word car' do
      expect(create_puzzle('car', ['a','r','c'])).to eq('c a r')
    end

    it 'prints a and r but not d' do
      expect(create_puzzle('car', ['a','r','d'])).to eq('_ a r')
    end

    it 'doesnt print d' do
      expect(create_puzzle('car', ['a','r','d'])).to_not include('d')
    end
  end

  context 'for the word "home"' do
    it 'prints all blanks when array is empty' do
      expect(create_puzzle('home')).to eq('_ _ _ _')
    end

    it 'prints all a when array = ["a"]' do
      expect(create_puzzle('home', ['o'])).to eq('_ o _ _')
    end

    it 'prints full word home' do
      expect(create_puzzle('home', ['h','o','m', 'f', 'e', 'o'])).to eq('h o m e')
    end

    it 'prints h, m and e but not o' do
      expect(create_puzzle('home', ['h','e','m'])).to eq('h _ m e')
    end

    it 'doesnt print d' do
      expect(create_puzzle('home', ['a','r','d'])).to_not include('d')
    end
  end
end

RSpec.describe "divisible_by_three" do
  context 'returns true' do
    it "0" do
      expect(divisible_by_three(0)).to eq(true)
    end
    it "9" do
      expect(divisible_by_three(9)).to eq(true)
    end
    it "300" do
      expect(divisible_by_three(300)).to eq(true)
    end
    it "3399" do
      expect(divisible_by_three(3399)).to eq(true)
    end
  end
  context 'returns false' do
    it "1" do
      expect(divisible_by_three(1)).to eq(false)
    end
    it "7" do
      expect(divisible_by_three(7)).to eq(false)
    end
    it "100" do
      expect(divisible_by_three(100)).to eq(false)
    end
    it "3379" do
      expect(divisible_by_three(3379)).to eq(false)
    end
  end
end

RSpec.describe 'perfect_square?' do
  it '4 returns true' do
    expect(perfect_square?(4)).to eq(true)
  end
  it '400 returns true' do
    expect(perfect_square?(400)).to eq(true)
  end
  it '7 returns false' do
    expect(perfect_square?(7)).to eq(false)
  end
  it '399 returns false' do
    expect(perfect_square?(399)).to eq(false)
  end
  it 'return ArgumentError message if input is 0' do
    expect{perfect_square?(0)}.to raise_error(ArgumentError, "number must be greater than or equal to one")
  end
  it 'return ArgumentError message if input is negative' do
    expect{perfect_square?(-7)}.to raise_error(ArgumentError, "number must be greater than or equal to one")
  end
end
