class CreateGroceryListItems < ActiveRecord::Migration
  def change
    create_table :grocery_list_items do |t|
      t.integer :grocery_list_id
      t.integer :item_id
      t.boolean :bought

      t.timestamps
    end
  	add_index :grocery_list_items, [:grocery_list_id, :bought]
  end
end
