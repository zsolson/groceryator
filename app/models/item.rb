class Item < ActiveRecord::Base
	has_many :grocery_list_items, :inverse_of => :item
	has_many :grocery_lists, through: :grocery_list_items
	validates :name, presence: true, uniqueness: true
end
