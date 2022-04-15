class SessionsController < ApplicationController

  skip_before_action :require_user, only: [:new, :create] # this skip require user to login before viewing. coz we need user to be able to access the login form to be abot to login in 

  def new
  end

  def create
    student = Student.find_by(email: params[:sessions][:email].downcase)
    if student.present? && student.authenticate(params[:sessions][:password]) # check if student then authenticate student's password
      if student.email_confirmed
        session[:student_id] = student.id  # We store user id to the session vaiable we use this to keep user l
        flash[:notice] = "You have successfully logged in"
        redirect_to student
        else
            flash.now[:error] = 'Please activate your account by following the instructions in the account confirmation email you received to proceed'
            render 'new'
        end
    else
      flash.now[:notice] = "Something was wrong with your login information"
      render :new
    end
  end

  def destroy
    session[:student_id] = nil  # to logout we just set the session variable to "nil"
    flash[:notice] ="You have successfully logged out"
    redirect_to root_path
  end

end