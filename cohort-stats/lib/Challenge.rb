class Challenge < Lesson
  def initialize(name, body)
    super(name, body)
    @submittable = true
  end
end
