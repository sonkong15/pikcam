class AddPrivateToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :private, :boolean, :default => false
    remove_column :uploads, :picture_file_type

  end
end
