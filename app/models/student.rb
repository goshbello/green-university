class Student < ApplicationRecord

  before_create :confirmation_token

  before_save {self.email = email.downcase} # convert downcase email letters before saving into DB

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 5, maximum: 30}

  validates :password, presence: true, length: {minimum: 5, maximum: 20}

  CONFIRMATION_TOKEN_EXPIRATION = 10.minutes
  
  # validates email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, 
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 },
            format: {with: VALID_EMAIL_REGEX}

  has_secure_password

  # Many-to-Many Association, student_courses
  has_many :student_courses
  has_many :courses, through: :student_courses



  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  private

  def confirmation_token
    if self.confirm_token.blank?
        self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

end