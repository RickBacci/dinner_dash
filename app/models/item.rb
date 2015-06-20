class Item < ActiveRecord::Base
  has_many :category_items
  has_many :categories, through: :category_items
  has_many :order_items
  has_many :orders, through: :order_items

  has_attached_file :picture,
    styles: { thumb: '100x100>', square: '200x200#', medium: '300x300>' },
    default_url: "default-medium.png"

  validates_attachment :picture,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
