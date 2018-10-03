class Category < ApplicationRecord
  has_many :post_categories, dependent: :restrict_with_error
  has_many :posts, through: :post_categories, source: :post
  validates_presence_of :name
end
