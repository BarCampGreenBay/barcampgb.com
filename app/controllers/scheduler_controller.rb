class SchedulerController < ApplicationController
  def index
    raise ActionController::RoutingError.new('Not Found') unless current_user.is_admin?

    @presentations = Presentation.includes(:users).load.reject{|p| p.users.empty?}.sort{|p| p.users.size}.reverse
    @users = User.includes(:presentations).reject{|u| u.presentations.empty?}.sort{|u| u.presentations.size}.reverse
  end
end
