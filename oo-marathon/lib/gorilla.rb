class Gorilla
  attr_reader :name

  def initialize (name)
    @name = name
  end

  def speak
    return "#{@name} got a bad feeling about this..."
  end
end
