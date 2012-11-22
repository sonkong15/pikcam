class AddDailymotionToFunnyVideos < ActiveRecord::Migration
  def change
    add_column :funny_videos, :dailymotionid, :text
    add_column :funny_videos, :youtubeid, :text
    add_column :funny_videos, :slug, :string
    add_index :funny_videos, :slug, unique: true
  end
end
