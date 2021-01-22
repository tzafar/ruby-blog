require 'bcrypt'

class UsersController < ApplicationController

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
    @user = User.find(params[:id])
  end

  def update
    updated_user_data = params.require(:user).permit(:fullname, :username)
    @user = User.find(params[:id])
    if @user.update(updated_user_data)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
end
