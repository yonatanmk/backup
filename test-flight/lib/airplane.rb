class Airplane
  attr_reader :type, :wing_loading, :horsepower, :engine_running, :flying, :fuel

  def initialize(type, wing_loading, horsepower, fuel)
    @type = type
    @wing_loading = wing_loading
    @horsepower = horsepower
    @engine_running = false
    @flying = false
    @fuel = fuel
  end

  def start
    if @engine_running
      return "engine already running"
    else
      if @fuel < 20
        return "not enough fuel"
      else
        @engine_running = true
        @fuel -= 20
        return "engine was started"
      end
    end
  end

  def takeoff
    if @engine_running
      if @fuel < 20
        return 'not enough fuel'
      else
        @flying = true
        @fuel -= 20
        return 'airplane launched'
      end
    else
      return 'airplane not started, please start'
    end
  end

  def land
    if @flying
      if @fuel < 20
        return "nor enough fuel, looks like you're gonna die"
      else
        @flying = false
        @fuel -= 20
        return 'airplane landed'
      end
    elsif @engine_running
      return "airplane already on the ground"
    else
      return 'airplane not started, please start'
    end
  end
end
