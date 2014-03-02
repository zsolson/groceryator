class GroceryList < ActiveRecord::Base
	self.per_page = 10
	belongs_to :user
	has_many :grocery_list_items
	has_many :items, through: :grocery_list_items
	default_scope -> { order('created_at DESC') }
	validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
	validates :user_id, presence: true

	def unbought_grocery_list_items
		grocery_list_items.where(:bought => false)
	end

	def bought_grocery_list_items
		grocery_list_items.where(:bought => true)
	end
end
