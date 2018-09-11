class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.integer :replies_count
      t.integer :viewed_count
      t.integer :post_count
      t.string :image
      t.integer :user_id
      t.timestamps
    end
  end
end
