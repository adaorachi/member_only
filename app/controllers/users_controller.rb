class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      create_session(@user)
      create_cookies(@user)
      flash['alert-success'] = 'Welcome! You are now a member'
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  private

  def user_params
    params.required(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      flash['alert-danger'] = 'You must be logged in to access that page!'
      redirect_to login_path
    end
  end
end
