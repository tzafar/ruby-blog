class SessionsController < ApplicationController

  def login
    render :login
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password_digest])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash.now[:notice] = "The credentials are not correct"
      render :login
    end
  end
end
