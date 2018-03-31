require_relative 'Array_methods'

class Apartment
  attr_reader :address, :city_or_town, :zip_code, :rent, :lease_start_date, :lease_end_date #:occupants, :max_occupants

  include Array_methods

  def initialize(address, city_or_town, zip_code, rent, lease_start_date, lease_end_date, max_occupants)
    @address = address
    @city_or_town = city_or_town
    @zip_code = zip_code
    @rent = rent
    @lease_start_date = lease_start_date
    @lease_end_date = lease_end_date
    # @occupants = []
    # @max_occupants = max_occupants
    super(max_occupants)
  end

  def full?
    return @items.length == @capacity
  end

  def empty?
    return @items.length == 0
  end

  def add_item(roomate)
    length = @items.length
    @items.each do |occupant|
      if occupant.same_person?(roomate)
        puts "#{roomate.first_name} #{roomate.last_name} already lives here silly!"
        return
      end
    end
    super(roomate)
    puts "#{roomate.first_name} #{roomate.last_name} has moved in" if @items.length > length
  end

  def remove_item(item)
    @items.each do |occupant|
      if occupant.same_person?(item)
        puts "#{item.first_name} #{item.last_name} has left the apartment"
        @items.delete_if do|occupant|
          occupant.same_person?(item)
        end
        return
      end
    end
    super(item, 'person')
  end

end
