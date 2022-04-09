class StudentsController < ApplicationController

  before_action :set_student, only: [:show, :edit, :update]
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
      flash[:notice] = "Student enrolled successfully"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end