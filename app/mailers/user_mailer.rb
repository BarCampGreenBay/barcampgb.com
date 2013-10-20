class UserMailer < ActionMailer::Base
  default from: "info@barcampgb.org"

  def registration_email(user)
    @user = user
    mail(to: @user.email, subject: 'BarCamp Green Bay 2013')
  end
end
