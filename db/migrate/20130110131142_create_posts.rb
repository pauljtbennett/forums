class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.references :conversation
      t.references :user
      t.references :post

      t.timestamps
    end
    add_index :posts, :conversation_id
    add_index :posts, :user_id
    add_index :posts, :post_id
  end
end
