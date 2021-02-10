require 'bcrypt'

class UsersController < ApplicationController

  before_action :set_current_user, only: [:show, :destroy, :update, :edit]
  before_action :require_user, except: [:index, :new]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user_hash = params.require(:user).permit(:fullname, :username, :password)
    @user = User.new(user_hash)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    updated_user_data = params.require(:user).permit(:fullname, :username)
    if @user.update(updated_user_data)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def show
    @articles = @user.articles
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  def set_current_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:alert] = "You are not allowed to perform this operations"
      redirect_to @user
    end
  end
end
