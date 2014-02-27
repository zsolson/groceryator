class AddIndexToGroceryListsCreatedAt < ActiveRecord::Migration
  def change
    add_index :grocery_lists, :created_at
  end
end
