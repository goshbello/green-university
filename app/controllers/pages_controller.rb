class PagesController < ApplicationController

  skip_before_action :require_user  # User can see the about page without loggin in

  def index
  end

  def about
  end

  def contact
  end
  
end