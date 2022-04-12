class Course < ApplicationRecord

  validates :code, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 5}
  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 15, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}

  # Many-to-Many Association, student_courses
  has_many :student_courses
  has_many :students, through: :student_courses
end
