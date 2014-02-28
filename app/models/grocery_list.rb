class GroceryList < ActiveRecord::Base
	self.per_page = 10
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :name, presence: true, length: { maximum: 50 }
	validates :user_id, presence: true
end
