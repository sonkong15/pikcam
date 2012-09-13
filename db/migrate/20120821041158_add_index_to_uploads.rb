class AddIndexToUploads < ActiveRecord::Migration
  def change
  	add_index :uploads, :user_id
  	add_index :categorizations, [:upload_id, :category_id]

  end
end
