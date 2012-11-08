class AddFacebookAndTwitterColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_uid, :string
    add_column :users, :twitter_uid, :string
    add_column :users, :image_url, :string
  end
end
