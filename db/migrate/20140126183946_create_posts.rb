class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.datetime :published

      t.timestamps
    end
  end
end