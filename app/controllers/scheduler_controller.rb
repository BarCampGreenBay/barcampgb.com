class SchedulerController < ApplicationController
  def people
    raise ActionController::RoutingError.new('Not Found') unless current_user.is_admin?

    @presentations = Presentation.includes(:users).load.reject{|p| p.users.empty?}.sort_by{|p| p.users.size}.reverse
    @users = User.includes(:presentations).reject{|u| u.presentations.empty?}.sort_by{|u| u.presentations.size}.reverse
  end

  def sessions
    raise ActionController::RoutingError.new('Not Found') unless current_user.is_admin?

    @presentations = Presentation.includes(:users).load.sort{|p| p.users.size}.reverse
  end
end
