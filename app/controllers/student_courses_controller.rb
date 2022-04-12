class StudentCoursesController < ApplicationController


  def create
    enroll_course = Course.find(params[:course_id]) # we store the id of the course user want to enroll
    unless current_user.courses.include?(enroll_course) # unless current_user already enrolled in this course
      StudentCourse.create(course: enroll_course, student: current_user) # create or add the course current user has selected to current user
      flash[:notice] = "You have successfully enrolled in #{enroll_course.title}"
      redirect_to current_user
    else
      flash[:notice] = "Something was wrong with your enrollment"
      redirect_to root_path
    end
  end
end