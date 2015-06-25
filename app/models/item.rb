class Item < ActiveRecord::Base
  has_many :category_items, dependent: :destroy
  has_many :categories, through: :category_items
  has_many :order_items
  has_many :orders, through: :order_items

  has_attached_file :picture,
                    styles: { thumb: '100x100>', square: '200x200#', medium: '300x300>' },
                    default_url: 'default-medium.png'

  validates_attachment :picture,
                       content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'] }

  validates :title, presence: true, allow_blank: false, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only: :decimal, greater_than: 0 }
  validates :categories, presence: true
end
