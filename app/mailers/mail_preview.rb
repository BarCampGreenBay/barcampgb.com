class MailPreview < MailView
  def welcome
    user = Struct.new(:email, :first_name).new('name@example.com', 'Jill')
    UserMailer.registration_email(user)
  end
end