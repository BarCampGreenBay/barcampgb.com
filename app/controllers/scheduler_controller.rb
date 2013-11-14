class SchedulerController < ApplicationController
  def index
    raise ActionController::RoutingError.new('Not Found') unless current_user.is_admin?

    @presentations = Presentation.includes(:users).load.reject{|p| p.users.empty?}.sort{|p| p.users.count}.reverse
    @users = User.includes(:presentations).reject{|u| u.presentations.empty?}.sort{|u| u.presentations.count}.reverse
  end
end
