class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if auth_hash
      @user = User.find_or_create_by_omniauth(auth_hash)
      set_session_user(@user)
    else
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        set_session_user(@user)
      else
        flash.now[:notice] = "Invalid email/password combination."
        @user = User.new
        render :new
      end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def set_session_user(user)
    session[:user_id] = user.id
    redirect_to user_path(user.id)
  end

  def auth_hash
    request.env["omniauth.auth"]
  end

end
