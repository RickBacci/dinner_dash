class Category < ActiveRecord::Base
  has_many :category_items, dependent: :destroy
  has_many :items, through: :category_items

  has_attached_file :image,
                    styles: { mini: '50x50>', thumb: '100x100>', square: '200x200#', medium: '300x300>' },
                    default_url: 'default-medium.png'

  validates_attachment :image,
                       content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'] }
end
