class Cage
  attr_accessor :animal

  def initialize
    @animal = nil
  end

  def empty?
    return !@animal
  end
end
