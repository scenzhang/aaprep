class Student
  attr_reader :first_name, :last_name, :courses

  def initialize(first, last)
    @first_name = first
    @last_name = last
    @courses = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def enroll(course)
    raise 'student has course conflict' if has_conflict?(course)
    @courses << course unless @courses.include?(course) 
    course.students << self
  end
  
  def course_load
    res = Hash.new(0)
    @courses.each do |course|
      res[course.department] += course.credits
    end
    res
  end

  def has_conflict?(course)
    @courses.any? { |c| c.conflicts_with?(course) }
  end
  


end
