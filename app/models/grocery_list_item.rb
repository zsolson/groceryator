class GroceryListItem < ActiveRecord::Base
	belongs_to :grocery_list
	belongs_to :item, :inverse_of => :grocery_list_items
	validates :price, :numericality => { :greater_than_or_equal_to => 0 }
end
