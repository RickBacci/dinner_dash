class Item < ActiveRecord::Base
  has_many :category_items
  has_many :categories, through: :category_items

has_attached_file :picture, styles: {thumb: '100x100>',
                                     square: '200x200#',
                                     medium: '300x300>'},
                             default_url: "default-medium.jpg",
                             storage: :s3,
                             bucket: ENV['dinner-dash'],
                             s3_credentials: { access_key_id: ENV["access_key_id"],
                                               secret_access_key: ENV["secret_access_key"]
                                             }
# do_not_validate_attachment_file_type :picture
 validates_attachment :picture, content_type: { content_type: ["picture/jpg", "picture/jpeg", "picture/png", "picture/gif"] }
end
