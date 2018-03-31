class Lesson
  attr_accessor :name, :body
  def initialize(name, body)
    @name = name
    @body = body
    @submittable = false
  end

  def submittable?
    return @submittable
  end

end
