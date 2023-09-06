class Gradebook
  attr_reader :courses
  def initialize
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def list_all_students
    all_students = @courses.map do |key, value|
      key = key, value = key.students
    end.to_h
  end

  def students_below(threshold)
    students_below = []
    @courses.each do |course|
      course.students.each do |student|
        if student.grade <= threshold
          students_below << student
        end
      end
    end
    students_below
  end
      
end