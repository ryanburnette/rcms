class CreateImagesPostsJoin < ActiveRecord::Migration
  
  def change
    create_table :images_posts, :id => false do |t|
      t.integer :image_id
      t.integer :post_id
    end

    add_index :images_posts, [:image_id, :post_id]
  end

end
