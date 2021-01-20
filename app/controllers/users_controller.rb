require 'bcrypt'

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_hash = params.require(:user).permit(:fullname, :username, :password)
    @user = User.new(user_hash)
    if @user.save
      redirect_to articles_path
    else
      render 'new'
    end
  end
end
