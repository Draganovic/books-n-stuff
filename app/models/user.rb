class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true
  validates :password, presence: true

  enum role: [:user, :admin]
end
