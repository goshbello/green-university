class StudentMailer < ApplicationMailer

  def student_welcome(student)
    @student = student 
    mail(to: @student.email, subject: 'Welcome to My Awesome Site')
  end

  def student_email_confirmation(student)
    @student = student 
    mail(:to => @student.email, :subject => "Registration Confirmation")
  end
end
