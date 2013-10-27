class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # what happens when a user isn't logged in - might want to do something besides redirect home
  def login!
    redirect_to root_path unless current_user
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
