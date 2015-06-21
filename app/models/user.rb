class User < ActiveRecord::Base
  has_secure_password
  has_many :order_items
  has_many :orders, through: :order_items

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_address, uniqueness: true, presence: true,
                            format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true, allow_blank: false
  validates :username, length: { in: 2..32 }

  enum role: %w(default admin)
end
