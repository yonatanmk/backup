class Fox
  attr_reader :name

  def initialize (name)
    @name = name
  end

  def speak
    return "Ring-ding-ding-ding-dingeringeding!"
  end
end
