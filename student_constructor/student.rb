class Student
  attr_reader :first_name, :last_name, :grades
  def initialize first_name, last_name, grades
    @first_name = first_name
    @last_name = last_name
    @grades = grades
  end
end

class StudentTwo
  attr_reader :first_name, :last_name, :grades, :average

  def initialize(info)
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @grades = info[:grades]
    @average = sprintf('%0.1f', info[:grades].inject(0){|sum, num| sum + num / grades.length.to_f} ).to_f
  end
end
