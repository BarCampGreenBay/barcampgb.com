class Presentation < ActiveRecord::Base
  belongs_to :presenter, class_name: 'User', foreign_key: 'user_id'
  has_and_belongs_to_many :users

  validates :title, presence: true, length: { maximum: 200, minimum: 6 }
  validates :description, presence: true, length: { maximum: 2000, minimum: 50 }

  def non_conflicting_presentations
    Presentation.includes(:users).all.select{|p| (p.users & self.users).empty?}
  end
end
