class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
    	t.string :title
    	t.integer :user_id
    	t.string :picture_file_type
    	t.integer :picture_file_size
    	t.string :picture_content_type
    	t.string :picture_file_name
    	t.datetime :picture_updated_at

      t.timestamps
    end
  end
end
