class UsersController < ApplicationController
  def new
  end

  def create
    @user = UserCreator.new(params[:user].symbolize_keys).create_user
    sign_in @user
    redirect_to root_url
  rescue ActiveRecord::RecordInvalid
    @user = User.new
    flash.now.alert = "That email address has already been taken"
    render :new
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to root_url, notice: "Your account has been updated."
    else
      render :edit
    end
  end

  def destroy
    current_user.destroy
    sign_out
    redirect_to root_url, notice: "Your account has been deleted."
  end

  private

  def user_params
    params[:user].permit(:email, :password, :password_confirmation)
  end
end
