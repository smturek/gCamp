class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_secure_password

  has_many :memberships
  has_many :comments

  def full_name
    "#{first_name} #{last_name}"
  end

end
