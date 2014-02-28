class AddIndexToGroceryListsName < ActiveRecord::Migration
  def change
  	add_index :grocery_lists, :name, unique: true
  end
end
