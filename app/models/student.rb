class Student < ApplicationRecord

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


  # Email confirmation methods
  def confirm!
    update_columns(confirmed_at: Time.current)
  end

  def confirmed?
    confirmed_at.present?
  end

  def generate_confirmation_token
    signed_id expires_in: CONFIRMATION_TOKEN_EXPIRATION, purpose: :confirm_email
  end

  def unconfirmed?
    !confirmed?
  end

  def send_confirmation_email!
    confirmation_token = generate_confirmation_token
    StudentNotificationMailer.confirmation(self, confirmation_token).deliver_now
  end

end