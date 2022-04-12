class StudentCourse < ApplicationRecord

  # Many-to-Many Association, student_courses
  belongs_to :student
  belongs_to :course
end