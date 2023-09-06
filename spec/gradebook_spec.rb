require 'rspec'
require './lib/gradebook'
require './lib/course'
require './lib/student'
require 'pry'

RSpec.describe Gradebook do
  before(:each) do
    @gradebook = Gradebook.new
    @course_1 =Course.new("Calculus", 2)
    @student1 = Student.new({name: "Morgan", age: 21})
    @student2 = Student.new({name: "Jordan", age: 29})
  end
  it 'exists' do
    expect(@gradebook).to be_instance_of(Gradebook)
  end

  it 'starts with no courses' do
    expect(@gradebook.courses).to eq([])
  end

  it 'can add courses' do
    expect(@gradebook.courses).to eq([])
    expect(@gradebook.add_course(@course_1)).to eq([@course_1])
  end

  it 'can list all students enrolled to courses' do
    @course_1.enroll(@student1)
    @course_1.enroll(@student2)
    @gradebook.add_course(@course_1)
    expect(@gradebook.list_all_students).to eq({@course_1 => [@student1, @student2]})
  end

  it 'can return a list of all students whose grades are below a given threshold' do
    @student1.log_score(93)
    @student1.log_score(96)
    @student2.log_score(75)
    @student2.log_score(54)
    @course_1.enroll(@student1)
    @course_1.enroll(@student2)
    @gradebook.add_course(@course_1)
    expect(@gradebook.students_below(75)).to eq([@student2])
  end
end