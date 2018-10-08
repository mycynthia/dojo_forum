class ModifyAttributeInPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :replies_count, :integer, default: 0
    change_column :posts, :viewed_count, :integer, default: 0
    change_column :posts, :post_count, :integer, default: 0
  end
end