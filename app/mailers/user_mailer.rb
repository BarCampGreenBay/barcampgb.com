class UserMailer < ActionMailer::Base
  default from: "BarCamp Green Bay <info@barcampgb.org>"

  def registration_email(user)
    @user = user
    mail(to: @user.email, subject: 'BarCamp Green Bay 2013')
  end

  def password_reset_email(user)
    @user = user
    mail(to: @user.email, subject: 'barcampgb.org Password Reset')
  end
end
