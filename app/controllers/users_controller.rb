class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def show
    @productions = Production.all if current_user.admin
    respond_to do |f|
      f.html
      f.json {render json: current_user}
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :role, :password, :password_confirmation, :admin)
  end

end
