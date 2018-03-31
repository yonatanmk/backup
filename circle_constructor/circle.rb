class Circle
  attr_reader :radius

  def initialize radius
    @radius = radius
  end

end

class CircleTwo
  attr_reader :radius

  def initialize input
    if input.kind_of?(Hash)
      if input.keys[0] == :radius
        @radius = sprintf('%0.1f', input.values[0].to_f).to_f
      else
        @radius = sprintf('%0.1f', input.values[0] / 2.to_f).to_f
      end
    else
      @radius = input.to_f
    end
  end

end
