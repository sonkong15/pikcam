class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :perishable_token, :string

    add_column :users, :persistence_token, :string

  end
end
