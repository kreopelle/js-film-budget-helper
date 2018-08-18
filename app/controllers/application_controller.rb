class ApplicationController < ActionController::Base

  def require_login
    #return head(:forbidden) unless session.include? :user_id
    redirect_to root_path unless session.include? :user_id
  end

end
