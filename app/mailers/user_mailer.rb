class UserMailer < ActionMailer::Base
  default from: "noreply@barcampgb.org"

  def registration_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to BarCamp Green Bay!')
  end
end
