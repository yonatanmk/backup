class Person
  attr_reader :first_name, :middle_name, :last_name
  def initialize *name
    case name.length
    when 3, 2
      @first_name = name[0].capitalize
      @middle_name = name[2].capitalize if name.length == 3
      @last_name = name[1].capitalize
    when 1
      @first_name = name[0].split(" ").first.capitalize
      @middle_name = name[0].split(" ")[1].capitalize if name[0].split(" ").length == 3
      @last_name = name[0].split(" ").last.capitalize
    end
  end
end
