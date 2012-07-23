class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :website_link, :string
    add_column :users, :facebook_link, :string

  end
end
