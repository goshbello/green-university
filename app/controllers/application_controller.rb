class ApplicationController < ActionController::Base

  before_action :require_user

  helper_method :current_user, :logged_in?  # this allow the following methods to be vaialable in the views

  #check if there is a current_user
  def current_user
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]
  end

  #return a boolean if current user exist or not
  def logged_in?
    !!current_user
  end

  #this method ensures that only login users can access exclusive content
  def require_user
    if !logged_in?
      flash[:notice] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end

end
