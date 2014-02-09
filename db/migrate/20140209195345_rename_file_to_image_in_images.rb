class RenameFileToImageInImages < ActiveRecord::Migration
  def change
    rename_column :images, :file, :image
  end
end
