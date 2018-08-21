class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if auth_hash
      user = User.find_or_create_by(uid: auth_hash["uid"]) do |u|
        u.uid = auth_hash["uid"]
        u.name = auth_hash["info"]["name"]
        u.email = auth_hash["info"]["email"]
        u.password = SecureRandom.hex
      end
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      user = User.find_by(email: params[:user][:email])
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user_path(user.id)
      else
        render :new
      end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def auth_hash
    request.env["omniauth.auth"]
  end

end
