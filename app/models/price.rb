class Price < ActiveRecord::Base
	belongs_to :item

	def update(new_price)
		with_lock do
			self.total += new_price
			self.count += 1
			if (self.max < new_price)
				self.max = new_price
			end
			if (self.min > new_price)
				self.min = new_price
			end
			self.avg = self.total / self.count
		end
	end
end
