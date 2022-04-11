class CoursesController < ApplicationController

  skip_before_action :require_user  # User can see list of courses without login

  def index
    @courses = Course.all
  end

  def new
  end

end