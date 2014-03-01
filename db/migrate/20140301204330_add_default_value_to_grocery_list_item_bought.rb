class AddDefaultValueToGroceryListItemBought < ActiveRecord::Migration
  	def up
    	change_column :grocery_list_items, :bought, :boolean, :default => false
	end

	def down
    	change_column :grocery_list_items, :bought, :boolean, :default => nil
	end
end
