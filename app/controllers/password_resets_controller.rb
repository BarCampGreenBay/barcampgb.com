class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    user.send_password_reset if user
    redirect_to root_url
    flash[:success] = 'Email sent with password reset instructions.'
  end

  def edit
    @user = User.find_by(password_reset_token: params[:id])

    redirect_to root_path unless @user
  end

  def update
    @user = User.find_by(password_reset_token: params[:id])

    if @user.update_attributes(user_params)
      redirect_to new_session_path
      flash[:success] = 'Password has been reset.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
