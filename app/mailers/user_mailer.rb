class UserMailer < ApplicationMailer

  default :from => 'support@greenuniversity.com' 

  def welcome_email(student)
    @student = student 
    mail(to: @student.email, subject: 'Welcome to My Awesome Site')
  end 
end
