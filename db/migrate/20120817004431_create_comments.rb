class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :body
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamps
    end
      add_index :comments, [:commentable_id, :commentable_type ]
      add_index :comments, :user_id

  end
end
