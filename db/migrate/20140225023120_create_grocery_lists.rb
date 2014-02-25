class CreateGroceryLists < ActiveRecord::Migration
  def change
    create_table :grocery_lists do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
    add_index :grocery_lists, :user_id
  end
end
