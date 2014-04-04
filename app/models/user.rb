class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt

  has_many :rounds

  has_secure_password

  validates :user_email, presence: true
  validates :user_email, uniqueness: true
  validates :user_name,  presence: true

  validates :user_name,  uniqueness: true
end
