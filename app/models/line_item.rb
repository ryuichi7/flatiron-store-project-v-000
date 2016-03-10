class LineItem < ActiveRecord::Base
	belongs_to :cart
	belongs_to :item
	


	def add_quantity
		update(quantity: quantity + 1)
	end

	def update_item_inventory
		item.update(inventory: item.inventory - quantity)
	end
end
