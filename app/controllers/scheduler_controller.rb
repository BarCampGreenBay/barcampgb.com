class SchedulerController < ApplicationController
  def index
    raise ActionController::RoutingError.new('Not Found') unless current_user.is_admin?

    @presentations = Presentation.includes(:users).load
    @users = User.includes(:presentations).load
  end
end
