class CreateFunnyVideos < ActiveRecord::Migration
  def change
    create_table :funny_videos do |t|
      t.string :title
      t.string :youtube
      t.text :youtube_html
      t.text :dailymotion
      t.text :dailymotion_html
      t.integer :user_id

      t.timestamps
    end
  end
end
