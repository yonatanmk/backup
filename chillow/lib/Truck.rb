require_relative 'Array_methods'

class Truck
  # attr_reader :boxes, :capacity

  include Array_methods

  # def initialize(capacity)
  #   @capacity = capacity
  #   @boxes = []
  # end

  # def full?
  #   return @boxes.length == capacity
  # end
  #
  # def empty?
  #   return @boxes.length == 0
  # end

  # def remove_box(target_box)
  #   if self.empty?
  #     puts "It's empty"
  #   else
  #     @items.each do |box|
  #       if box == target_box
  #         @items.delete(box)
  #         return
  #       end
  #     end
  #     puts "That box isn't here"
  #   end
  # end

  def remove_all(owner)
    @items = @items.select {|box| box.owner != owner}
  end
end
