class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  before_action :current_user

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def logged_in?
    !!session[:user_id]
  end

  private

  def require_admin
    redirect_to user_path(current_user) unless current_user.admin
  end

  def user_not_authorized
    redirect_to user_path(current_user), notice: "You are not authorized to perform this action."
  end

  def require_login
    redirect_to root_path unless logged_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if logged_in?
  end

  helper_method :current_user

end
