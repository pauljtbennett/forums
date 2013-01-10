class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :title
      t.references :forum
      t.references :user

      t.timestamps
    end
    add_index :conversations, :forum_id
    add_index :conversations, :user_id
  end
end
