class Python
  attr_reader :name

  include Reptile

  def initialize (name)
    @name = name
  end

  def speak
    return "SSSSssssss..."
  end

  def cold_blooded

  end
end
