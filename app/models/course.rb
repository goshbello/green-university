class Course < ApplicationRecord

  validates :code, presence: true, length: { minimum: 4, maximum: 5}
  validates :title, presence: true, length: { minimum: 15, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
end
