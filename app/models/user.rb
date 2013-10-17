class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }
  validates :shirt_size, presence: true
  validates :diet_concerns, allow_blank: true, length: { minimum: 10 }

  after_create :send_registration_email

  def full_name
    "#{first_name} #{last_name}"
  end

  private

    def send_registration_email
      UserMailer.registration_email(self).deliver
    end
end
