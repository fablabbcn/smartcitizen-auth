class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.where("email = ? OR username = ?", params[:email]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:user_return_to], notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end

end
