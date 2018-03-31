class SystemCheckSubmission
  attr_reader :solution, :student, :grade
  def initialize(solution, student)
    @solution = solution
    @student = student
    @grade = nil
  end

  def assign_grade(grade)
    if grade.class != Fixnum || grade < 0
      raise InvalidGradeError
    else
      @grade = grade
    end
  end

  def graded?
    return !!@grade
  end
end

class InvalidGradeError < StandardError
end
