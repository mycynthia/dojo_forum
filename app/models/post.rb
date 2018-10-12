class Post < ApplicationRecord
  has_many :post_categories
  has_many :categories, through: :post_categories, source: :category
  has_many :comments
  belongs_to :user
  validates_presence_of :title
# carrierwave照片上傳器
mount_uploader :image, PhotoUploader

 scope :published, -> { where('published_at IS NOT NULL') } 
 scope :draft, -> { where('published_at IS NULL') }
end
