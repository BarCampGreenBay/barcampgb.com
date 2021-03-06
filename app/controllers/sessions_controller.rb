class SessionsController < ApplicationController
  def new
    redirect_to presentations_path if signed_in?
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You're in!"
      redirect_to presentations_path
    else
      flash[:error] = "Sorry, we couldn't find you in our system."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You're logged out!"
    redirect_to presentations_path
  end
end
