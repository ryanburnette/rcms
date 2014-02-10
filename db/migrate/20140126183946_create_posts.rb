class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.datetime :date
      t.integer :admin_user_id
      t.timestamps
    end
    add_index :posts, :admin_user_id
  end
end
