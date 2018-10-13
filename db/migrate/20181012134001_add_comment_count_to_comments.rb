class AddCommentCountToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :comment_count, :integer, default: 0
    change_column :users, :user_count, :integer, default: 0
  end
end
