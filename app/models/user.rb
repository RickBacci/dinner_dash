class User < ActiveRecord::Base
  has_secure_password

  validates :name, :email_address, :username, presence: true
  validates :username, :email_address, uniqueness: true

  enum role: %w(default admin)
end
