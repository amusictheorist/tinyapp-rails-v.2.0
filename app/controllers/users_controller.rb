class UsersController < ApplicationController
  def login
    render 'users/login'
  end

  def new
    @user = User.new
    render 'users/register'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Welcome, #{@user.email}!"
    else
      flash.now[:alert] = 'There was a problem creating your account.'
      render 'users/register'
    end
  end

  def show
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
