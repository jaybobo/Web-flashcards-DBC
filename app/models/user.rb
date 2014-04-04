class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds
  validates :user_email, presence: true
  validates :user_email, uniqueness: true
  validates :user_name,  presence: true
  validates :user_name,  uniqueness: true
  validates :user_password,  uniqueness: true
  validates :user_password,  presence: true
end
