class AddIndexToGroceryListComplete < ActiveRecord::Migration
  def change
  	add_index :grocery_lists, :complete
  end
end
