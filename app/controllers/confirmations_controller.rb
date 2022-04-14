class ConfirmationsController < ApplicationController
  
  def new
    @student = Student.new
  end


  def create
    @student = Student.find_by(email: params[:user][:email].downcase)

    if @student.present? && @student.unconfirmed?
      redirect_to root_path, notice: "Check your email for confirmation instructions."
    else
      redirect_to new_confirmation_path, alert: "We could not find a user with that email or that email has already been confirmed."
    end
  end

  def edit
    @student = Student.find_signed(params[:confirmation_token], purpose: :confirm_email)

    if @student.present?
      @student.confirm!
      redirect_to root_path, notice: "Your account has been confirmed."
    else
      redirect_to new_confirmation_path, alert: "Invalid token."
    end
  end


end