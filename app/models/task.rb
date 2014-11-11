class Task < ActiveRecord::Base

  validates :description, presence: true
  validate :due_date_in_past


  def due_date_in_past
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "can't be in the past")
    end
  end

end
