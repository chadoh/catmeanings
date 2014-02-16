class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_to root_url
    else
      redirect_to root_url, notice: "Email or password is invalid."
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
