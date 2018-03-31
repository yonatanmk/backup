#require_relative './bounding_box'

class BoundingArea
  def initialize (box_array)
    @box_array = box_array
  end

  def boxes_contain_point?(x, y)
    if @box_array.empty?
      return false
    end
    @box_array.each do |box|
      if box.contains_point?(x, y)
        return true
      end
    end
    return false
  end

end
