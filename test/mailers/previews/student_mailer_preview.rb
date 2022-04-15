# Preview all emails at http://localhost:3000/rails/mailers/student_mailer
class StudentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/student_mailer/student_welcome
  def student_welcome
    StudentMailer.student_welcome
  end

  # Preview this email at http://localhost:3000/rails/mailers/student_mailer/student_email_confirmation
  def student_email_confirmation
    StudentMailer.student_email_confirmation
  end

end
