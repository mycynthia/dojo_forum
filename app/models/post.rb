class Post < ApplicationRecord
  has_many :post_categories, dependent: :restrict_with_error
  has_many :categories, through: :post_categories, source: :category
  has_many :comments
  validates_presence_of :title
# carrierwave照片上傳器
mount_uploader :image, PhotoUploader
end
