class AddCompleteToGroceryList < ActiveRecord::Migration
  def change
    add_column :grocery_lists, :complete, :boolean, :default => false
  end
end
