class Membership < ActiveRecord::Base

  validates :user_id, presence: true

  belongs_to :project
  belongs_to :user
  belongs_to :role

end
