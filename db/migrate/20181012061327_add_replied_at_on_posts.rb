class AddRepliedAtOnPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :replied_at, :datetime
  end
end
