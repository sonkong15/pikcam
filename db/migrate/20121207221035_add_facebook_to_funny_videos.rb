class AddFacebookToFunnyVideos < ActiveRecord::Migration
  def change
    add_column :funny_videos, :facebook, :text
    add_column :funny_videos, :facebook_html, :text
    add_column :funny_videos, :facebook_id, :string
  end
end
