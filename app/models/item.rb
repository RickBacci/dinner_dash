class Item < ActiveRecord::Base
  has_many :order_items
  has_many :categories, through: :order_items
end
