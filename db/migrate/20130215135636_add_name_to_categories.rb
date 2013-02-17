class AddNameToCategories < ActiveRecord::Migration
  def change
  	add_column :categories, :title, :string
  	add_column :categories, :description, :text
  	add_column :categories, :slug, :string, unique: true
    add_index :categories, :slug
  end
end
