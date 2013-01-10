class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :name
      t.references :site
      t.references :user

      t.timestamps
    end
    add_index :forums, :site_id
    add_index :forums, :user_id
  end
end
