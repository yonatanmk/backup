class BoundingBox
  attr_reader :width, :height

  def initialize (x, y, width, height)
    @x = x
    @y = y
    @width = width
    @height = height
  end

  def left
    return @x
  end

  def right
    return @x + @width
  end

  def bottom
    return @y
  end

  def top
    return @y + @height
  end

  def contains_point? (x, y)
    if x >= self.left && x <= self.right && y >= self.bottom && y <= self.top
      return true
    else
      return false
    end
  end

end
