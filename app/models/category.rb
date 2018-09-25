class Category < ApplicationRecord
  has_many :post_categories, dependent: :restrict_with_error
  has_many :posted_categories, through: :post_categories, source: :post
end
