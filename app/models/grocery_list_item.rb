class GroceryListItem < ActiveRecord::Base
	belongs_to :grocery_list
	belongs_to :item, :inverse_of => :grocery_list_items
end
