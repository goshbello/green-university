class Student < ApplicationRecord

  before_save {self.email = email.downcase} # convert downcase email letters before saving into DB

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 5, maximum: 30}

  validates :password, presence: true, length: {minimum: 5, maximum: 20}
  
  # validates email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, 
             uniqueness: { case_sensitive: false },
             length: { maximum: 105 },
             format: {with: VALID_EMAIL_REGEX}

has_secure_password

end