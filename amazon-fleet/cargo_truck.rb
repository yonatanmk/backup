class CargoTruck
  attr_reader :plate_number, :branding, :odometer
  attr_accessor :driver

  def initialize plate_number, branding
    @plate_number = plate_number
    @branding = branding
    @odometer = 0
    @driver = nil
  end

  def summary
    return "#{@branding} truck with plate #{@plate_number} is driven by #{@driver}."
  end

end
