class UsersController < ApplicationController
  before_action :already_logged_in?, only:[:create, :new]

  def new
    @user = User.new
    render :new
  end

  def create

    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to cats_url
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password_digest, :session_token, :password)
  end
end
