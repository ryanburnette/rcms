class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.datetime :date

      add_index :posts, :slug, :sluggable_type, unique: true

      t.timestamps
    end
  end
end
