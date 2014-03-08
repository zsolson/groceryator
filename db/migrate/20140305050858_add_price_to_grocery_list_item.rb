class AddPriceToGroceryListItem < ActiveRecord::Migration
  def change
    add_column :grocery_list_items, :price, :decimal, :precision => 6, :scale => 2, :default => 0
  end
end
