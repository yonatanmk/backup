class SystemCheck < Lesson
  attr_reader :name, :due_date, :submissions

  def initialize(name, due_date)
    @due_date = due_date
    @submissions = []
    super(name, nil)
    @submittable = true
  end

  def add_submission(submission)
    @submissions << submission
  end

  def average_grade
    #if you wanted to only average graded submissions you'd use the following commented out code
    # graded_submissions = @submissions.select{|submission| submission.grade != nil}
    # total = graded_submissions.reduce(0){|sum, submission| sum + submission.grade.to_f}
    # return total / graded_submissions.length
    total = @submissions.reduce(0){|sum, submission| sum + submission.grade.to_f}
    return total / @submissions.length
  end

  def did_student_complete_system_check?(student)
    @submissions.each do |submission|
      return true if submission.student == student
    end
    return false
  end

end
