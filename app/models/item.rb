class Item < ActiveRecord::Base
  has_many :category_items
  has_many :categories, through: :category_items

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }

end
