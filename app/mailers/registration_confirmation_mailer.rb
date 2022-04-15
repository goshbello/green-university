class RegistrationConfirmationMailer < ApplicationMailer

    default :from => 'support@greenuniversity.com' 

    def email_confirmation_mailer(student)
      @student = student 
      mail(:to => @student.email, :subject => "Registration Confirmation")
    end 
end
