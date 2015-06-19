class Item < ActiveRecord::Base
  has_many :category_items
  has_many :categories, through: :category_items
  has_many :order_items
  has_many :orders, through: :order_items

  has_attached_file :picture,
    styles: { thumb: '100x100>', square: '200x200#', medium: '300x300>' },
    default_url: "default-medium.png",
    storage: :s3,
    s3_credentials: Proc.new{|a| a.instance.s3_credentials }

  def s3_credentials
    { access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      bucket: ENV['S3_BUCKET'],
    }
  end

  validates_attachment :picture,
    content_type: { content_type:
                    ["image/jpg", "image/jpeg", "image/png", "image/gif"]
                  }
end
