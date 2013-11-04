class User < ActiveRecord::Base
  has_secure_password

  has_one :presentation
  has_and_belongs_to_many :presentations

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }
  validates :shirt_size, presence: true

  after_create :send_registration_email

  def full_name
    "#{first_name} #{last_name}"
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!

    UserMailer.password_reset_email(self).deliver
  end

  private

  def send_registration_email
    UserMailer.registration_email(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
