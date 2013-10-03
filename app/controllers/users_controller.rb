class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Congrats, you're all signed up!"
      redirect_to root_path
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :twitter,
        :shirt_size,
        :diet_concerns
      )
    end
end
