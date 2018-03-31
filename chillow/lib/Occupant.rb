class Occupant
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def same_person?(person)
    return @first_name == person.first_name && @last_name == person.last_name
  end
end
