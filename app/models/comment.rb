class Comment < ActiveRecord::Base

  validates :comment, :presence => true
  validates :task_id, :presence => true

  belongs_to :user
  belongs_to :task

end
