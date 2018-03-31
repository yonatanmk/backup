class Cohort
  attr_reader :title, :start_date, :end_date, :students, :system_checks, :career_kickoff
  def initialize(title, start_date, end_date)
    @title = title
    @start_date = start_date
    @end_date = end_date
    @students = []
    @system_checks = []
    @career_kickoff = end_date + 4
  end

  def enroll(student)
    unless @students.include?(student)
      @students << student
    end
  end

  def assign(system_check)
    @system_checks << system_check
  end

  def roster
    output = @title + "\n"
    output += @students.map{|student|"#{student.name}: #{student.email}"}.join("\n")
    return output
  end

  def system_check_completed?(system_check)
    @students.each do |student|
      return false if !system_check.did_student_complete_system_check?(student)
    end
    return true
  end
end
