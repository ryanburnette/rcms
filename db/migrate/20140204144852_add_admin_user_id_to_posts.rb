class AddAdminUserIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :admin_user_id, :integer
  end

  add_index :posts, :admin_user_id
end
