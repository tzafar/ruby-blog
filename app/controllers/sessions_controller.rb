class SessionsController < ApplicationController

  def login
    render :login
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully"
      redirect_to user
    else
      flash.now[:alert] = "There was something wrong with your login details"
      render :login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
