module Array_methods
  attr_reader :items, :capacity
  def initialize(capacity)
    @items = []
    @capacity = capacity
  end

  def full?
    @items.length == @capacity
  end

  def empty?
    @items.length == 0
  end

  def add_item(item)
    if self.full?
      puts "It's full"
    else
      @items << item
    end
  end

  def remove_item(target_item, item_name)
    if self.empty?
      puts "It's empty"
    else
      @items.each do |item|
        if item == target_item
          @items.delete(item)
          return
        end
      end
      puts "That #{item_name} isn't here"
    end
  end

end

def remove_roomate(roomate)
  if self.empty?
    puts "This apartment is empty"
  else
    @items.each do |occupant|
      if occupant.same_person?(roomate)
        puts "#{roomate.first_name} #{roomate.last_name} has left the apartment"
        @items.delete_if do|occupant|
          occupant.same_person?(roomate)
        end
        return
      end
    end
    puts "Nobody lives here by that name"
  end
end
#
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
