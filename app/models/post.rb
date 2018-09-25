class Post < ApplicationRecord
  has_many :post_categories, dependent: :restrict_with_error
  has_many :posted_categories, through: :post_categories, source: :category

# carrierwave照片上傳器
mount_uploader :image, PhotoUploader
end
