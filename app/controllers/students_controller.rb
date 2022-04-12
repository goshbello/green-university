class StudentsController < ApplicationController

  skip_before_action :require_user, only: [:new, :create] # to allow user to enroll
  before_action :set_student, only: [:show, :edit, :update]
  before_action :require_same_student, only: [:edit, :update] # to edit profile, student must logged in and the profile must belong to the logged in user. So logged in user can only edit their own profile

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def show
  end

  def edit
  end

  def update
    if @student.update(student_params)
      flash[:notice] = "Your profile has been successfully updated"
      redirect_to @student # or student_path(@student)
    else
      render :edit
    end
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = "Welcome to Green University #{@student.name}. You have successfully enrolled"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def require_same_student
    if current_user != @student  # if profile viewing is not for current user
      flash[:notice] = "You can only edit your own profile"
      redirect_to student_path(current_user)
    end
  end
end