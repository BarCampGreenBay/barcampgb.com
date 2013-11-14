class User < ActiveRecord::Base
  has_secure_password(validations: false)

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

  def short_name
    "#{first_name} #{last_name.first}"
  end

  def send_password_reset
    set_password_reset_token
    UserMailer.password_reset_email(self).deliver
  end

  def attend(presentation)
    presentations << presentation unless is_attending?(presentation)
  end

  def unattend(presentation)
    presentations.delete(presentation) if is_attending?(presentation)
  end

  def is_attending?(presentation)
    presentations.include?(presentation)
  end

  def is_admin?
    admin?
  end

  private

  def send_registration_email
    set_password_reset_token
    UserMailer.registration_email(self).deliver
  end

  def set_password_reset_token
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
