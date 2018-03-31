class Rectangle
  attr_reader :width, :height

  def initialize width, height = nil
    @width = width
    if height
      @height = height
    else
      @height = nil
    end
  end

  def area
    return @width ** 2 unless height
    return @width * @height
  end
end
