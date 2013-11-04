class Presentation < ActiveRecord::Base
  belongs_to :presenter, class_name: 'User'
  has_and_belongs_to_many :users
end
