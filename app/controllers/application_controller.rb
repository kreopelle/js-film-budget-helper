class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  
  before_action :current_user

  def logged_in?
    !!session[:user_id]
  end

  private

  def require_login
      redirect_to root_path unless logged_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if logged_in?
  end
  helper_method :current_user

end
